import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nutriai/firebase_options.dart';
import 'package:nutriai/provider/user_provider.dart';
import 'package:nutriai/screens/home/home_screen.dart';
import 'package:nutriai/screens/login/login_screen.dart';
import 'package:nutriai/screens/login/sign_up_screen.dart';
import 'app_localizations.dart';
import 'color_scheme/color_scheme.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/ask_user/ask_user_step1.dart';
import 'screens/ask_user/ask_user_step2.dart';
import 'screens/ask_user/ask_user_step3.dart';
import 'screens/ask_user/ask_user_step4.dart';
import 'screens/ask_user/ask_user_step5.dart';
import 'screens/ask_user/ask_user_step6.dart';
import 'screens/ask_user/ask_user_step7.dart';
import 'screens/ask_user/ask_user_step8.dart';
import 'screens/ask_user/ask_user_step9.dart';
import 'screens/ask_user/ask_user_step10.dart';
import 'screens/ask_user/ask_user_step11.dart';
import 'screens/ask_user/ask_user_step12.dart';
import 'screens/ask_user/ask_user_step13.dart';
import 'screens/ask_user/ask_user_step14.dart';
import 'screens/ask_user/ask_user_step15.dart';
import 'screens/ask_user/ask_user_step16.dart';
import 'screens/ask_user/ask_user_step17.dart';
import 'screens/ask_user/ask_user_step18.dart';
import 'screens/ask_user/ask_user_step19.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nutri AI',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme(
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
            surface: AppColors.surfaceColor,
            error: AppColors.errorColor,
            onPrimary: AppColors.onPrimaryColor,
            onSecondary: AppColors.onSecondaryColor,
            onSurface: AppColors.onSurfaceColor,
            onError: AppColors.onErrorColor,
            brightness: Brightness.light, background: Colors.white,
            onBackground: Colors.black, // Add background and onBackground
          ),
        ),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),
        ],
        locale: const Locale('fr'), // Default to French
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // User is logged in, check if registered
                return Consumer<UserProvider>(
                  builder: (context, userProvider, _) {
                    if (!userProvider.isDataLoaded) {
                      // Data is not loaded yet, show a loading indicator
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (userProvider.isRegistered) {
                      return const HomeScreen(); // User is registered
                    } else {
                      return const OnboardingScreen(); // User is not registered
                    }
                  },
                );
              } else {
                return const LoginScreen(); // User is not logged in
              }
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        routes: {
          // '/': (context) => const LoginScreen(), // Using StreamBuilder for initial route
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/home': (context) => const HomeScreen(),
          '/ask_user_step1': (context) => const AskUserStep1(),
          '/ask_user_step2': (context) => const AskUserStep2(),
          '/ask_user_step3': (context) => const AskUserStep3(),
          '/ask_user_step4': (context) => const AskUserStep4(),
          '/ask_user_step5': (context) => const AskUserStep5(),
          '/ask_user_step6': (context) => const AskUserStep6(),
          '/ask_user_step7': (context) => const AskUserStep7(),
          '/ask_user_step8': (context) => const AskUserStep8(),
          '/ask_user_step9': (context) => const AskUserStep9(),
          '/ask_user_step10': (context) => const AskUserStep10(),
          '/ask_user_step11': (context) => const AskUserStep11(),
          '/ask_user_step12': (context) => const AskUserStep12(),
          '/ask_user_step13': (context) => const AskUserStep13(),
          '/ask_user_step14': (context) => const AskUserStep14(),
          '/ask_user_step15': (context) => const AskUserStep15(),
          '/ask_user_step16': (context) => const AskUserStep16(),
          '/ask_user_step17': (context) => const AskUserStep17(),
          '/ask_user_step18': (context) => const AskUserStep18(),
          '/ask_user_step19': (context) => const AskUserStep19(),
        },
      ),
    );
  }
}
