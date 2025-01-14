import 'package:flutter/material.dart';
import 'package:nutriai/resources/auth_methods.dart';
import 'package:nutriai/screens/login/login_screen.dart';
import 'package:nutriai/widgets/input_text_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (res == "success") {
      // Navigate to the onboarding screen or home screen
      Navigator.of(context).pushReplacementNamed('/onboarding');
    } else {
      showSnackBar(res, context);
    }
  }

  void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 64.0),
                // Logo (replace with your logo)
                Image.asset(
                  'assets/logo.png', // Replace with your logo asset
                  height: 100.0,
                ),
                const SizedBox(height: 64.0),
                // Username textfield
                InputTextWidget(
                  hintText: 'Entrez votre nom d\'utilisateur',
                  controller: _usernameController,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 24.0),
                // Email textfield
                InputTextWidget(
                  hintText: 'Entrez votre email',
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                // Password textfield
                InputTextWidget(
                  hintText: 'Entrez votre mot de passe',
                  controller: _passwordController,
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 24.0),
                // Signup button
                InkWell(
                  onTap: signUpUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      color: Colors.blue, // Replace with your primary color
                    ),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'S\'inscrire',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(height: 24.0),
                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous avez déjà un compte?"),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: const Text(
                        " Se connecter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Replace with your primary color
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
