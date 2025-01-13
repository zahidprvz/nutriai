import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../../app_localizations.dart';
import '../../provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    // Process the image using Gemini AI and display the results
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization?.translate("home_title") ?? 'Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null)
              Image.file(File(_image!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(localization?.translate("pick_image") ?? 'Pick Image'),
            ),
            if (!userProvider.isRegistered)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ask_user_step1');
                },
                child: Text(localization?.translate("complete_registration") ?? 'Complete Registration'),
              ),
          ],
        ),
      ),
    );
  }
}
