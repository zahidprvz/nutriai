import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nutriai/widgets/food_nutrition_widget.dart';
import 'package:nutriai/widgets/loading_indicator_widget.dart';
import 'package:nutriai/widgets/upload_options_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/user_provider.dart';
import '../../app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool _isLoading = false;
  Map<String, dynamic>? _foodData;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust the duration as needed
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = image;
        _isLoading = true;
        _foodData = null;
      });

      // Call Gemini API to analyze the image
      _analyzeImageWithGemini(image);
    }
  }

  Future<void> _analyzeImageWithGemini(XFile image) async {
    const apiKey =
        'AIzaSyD6KwygU1v79sfLxmrzscgxE3_54rS5stw'; // Replace with your actual API key
    const apiUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey';

    try {
      final imageBytes = await image.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {
                  'text':
                      'Analyze the food in this image and provide its nutritional values in the following JSON format:\n\n`json\n{\n  "food": "Food Name",\n  "protein": "Protein value in grams",\n  "carbs": "Carbs value in grams",\n  "fat": "Fat value in grams",\n  "calories": "Total calorie value"\n}\n`\n\nIf you are unable to determine the exact nutritional values, provide your best estimate using typical values for this type of food. Always provide a value for each field, even if it is an estimate or a range. Do not return any fields with a "not found" value. Ensure the output is valid JSON and only includes the JSON, no additional text.'
                },
                {
                  'inlineData': {
                    'mimeType': 'image/jpeg',
                    'data': base64Image,
                  }
                },
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("API Response: ${response.body}");

        // Updated parsing logic:
        if (responseData.containsKey('candidates') &&
            responseData['candidates'].isNotEmpty) {
          final candidate = responseData['candidates'][0];
          if (candidate.containsKey('content') &&
              candidate['content'].containsKey('parts')) {
            final parts = candidate['content']['parts'];
            final textPart = parts.firstWhere(
              (part) =>
                  part is Map<String, dynamic> && part.containsKey('text'),
              orElse: () => null,
            );

            if (textPart != null) {
              final textResponse = textPart['text'];

              // Find JSON string within `json ... `
              final regex = RegExp(r'`json(.*?)`', dotAll: true);
              final match = regex.firstMatch(textResponse);

              if (match != null) {
                final jsonString = match.group(1)!.trim();
                print("Extracted JSON: $jsonString");

                try {
                  final foodData = jsonDecode(jsonString);

                  if (foodData is Map<String, dynamic> &&
                      foodData.containsKey('food')) {
                    setState(() {
                      _foodData = foodData;
                    });
                  } else {
                    throw Exception('Invalid food data format: $jsonString');
                  }
                } catch (e) {
                  print("Error decoding inner JSON: $e");
                  setState(() {
                    _foodData = {'error': 'Error decoding food data.'};
                  });
                }
              } else {
                print("Could not find JSON in the text response.");
                setState(() {
                  _foodData = {
                    'error': 'Could not find food data in the response.'
                  };
                });
              }
            } else {
              print("Text part not found in the response.");
              setState(() {
                _foodData = {'error': 'Text part not found in the response.'};
              });
            }
          } else {
            print("Content or parts not found in the candidate.");
            setState(() {
              _foodData = {
                'error': 'Content or parts not found in the candidate.'
              };
            });
          }
        } else {
          print("No candidates found in the response.");
          setState(() {
            _foodData = {'error': 'No candidates found in the response.'};
          });
        }
      } else {
        print(
            'Failed to analyze image: ${response.statusCode} ${response.body}');
        setState(() {
          _foodData = {
            'error': 'Failed to analyze image: ${response.statusCode}'
          };
        });
      }
    } catch (e) {
      print("Error analyzing image: $e");
      setState(() {
        _foodData = {'error': 'Error: $e'};
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showUploadOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return UploadOptionsWidget(
          onOptionSelected: (source) {
            _pickImage(source);
          },
        );
      },
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login screen or any other appropriate screen
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error signing out: $e");
      // Handle sign-out error (e.g., show an error message)
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization?.translate("home_title") ?? 'Home'),
        actions: [
          // Sign out button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null)
              Expanded(
                child: _isLoading
                    ? LoadingIndicatorWidget(
                        controller: _animationController) // Pass the controller
                    : Image.file(File(_image!.path)),
              ),
            if (_foodData != null) FoodNutritionsWidget(foodData: _foodData!),
            // Make the button look like it's from the ask user steps
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _showUploadOptions,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .primaryColor, // Use the primary color from theme
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity,
                            50), // Make button expand horizontally
                      ),
                      child: Text(
                        localization?.translate("pick_image") ?? 'Pick Image',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            if (!userProvider.isRegistered)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ask_user_step1');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          localization?.translate("complete_registration") ??
                              'Complete Registration',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
