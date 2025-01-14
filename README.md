# NutriAI - Your Personalized Nutrition Companion

## Overview

**NutriAI** is an innovative mobile application designed to revolutionize how users approach their nutrition and dietary goals. Inspired by the intuitive data collection process seen in the Cal AI app, NutriAI offers a comprehensive 19-step onboarding experience to gather detailed user information. This data powers a personalized nutrition management platform. Leveraging the cutting-edge capabilities of the Google's Gemini Pro Vision API, NutriAI can analyze food images to provide accurate nutritional breakdowns, making calorie and macro tracking easier than ever before.

This project is currently under active development. This README outlines the current features, setup instructions, and future development plans.

**GitHub:** [https://github.com/zahidprvz/nutriai](https://github.com/zahidprvz/nutriai)
**LinkedIn:** [https://www.linkedin.com/in/zahidprvz/](https://www.linkedin.com/in/zahidprvz/)

## Features (Current Deliverable - Phase 1)

*   **User-Friendly Onboarding:** A streamlined 19-step onboarding process to collect essential user data, mirroring the intuitive design of the Cal AI app.
*   **Firebase Authentication:** Secure user registration and login using email and password via Firebase Authentication.
*   **Firebase Firestore Integration:** Robust data storage for user profiles and preferences, ensuring data persistence and scalability.
*   **Data Privacy:** Strong emphasis on user privacy and data security, with secure handling of personal information.
*   **Basic UI Structure:** A clean and intuitive user interface designed for ease of navigation and a positive user experience.
*   **Food Image Analysis (Preliminary):** Initial integration with the Google's Gemini Pro Vision API for food image analysis. Currently, the app can capture or upload images, send them to the API, and receive a basic response.
*   **Loading State Handling:** Smooth loading animations and clear error handling for a seamless user experience during API calls.

## Technology Stack

*   **Flutter:** For building a cross-platform application (iOS and Android).
*   **Dart:** Programming language used with Flutter.
*   **Firebase:**
    *   **Authentication:** User sign-up and login.
    *   **Firestore:** NoSQL database for storing user data.
*   **Google's Gemini Pro Vision API:** For analyzing food images and extracting nutritional information.
*   **Provider:** For state management.
*   **Image Picker:** For selecting images from the gallery or camera.
*   **http:** For making API requests.

## Getting Started

### Prerequisites

*   **Flutter SDK:** Ensure you have the latest stable version of Flutter installed. Refer to the official Flutter installation guide for your operating system: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   **Firebase Account:** You will need a Firebase account and a project set up in the Firebase console: [https://console.firebase.google.com/](https://console.firebase.google.com/)
*   **Google Cloud Project with Gemini API Enabled:**
    *   Create a Google Cloud Project.
    *   Enable the Generative Language API.
    *   Generate an API key for your project.

### Installation

1.  **Clone the Repository:**

    ```bash
    git clone [invalid URL removed]
    cd nutriai
    ```

2.  **Install Dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Firebase Configuration:**

    *   **iOS:**
        *   In the Firebase console, add an iOS app to your Firebase project.
        *   Follow the instructions to download the `GoogleService-Info.plist` file.
        *   Drag and drop this file into the `ios/Runner` directory of your Flutter project using Xcode.
    *   **Android:**
        *   In the Firebase console, add an Android app to your Firebase project.
        *   Follow the instructions to download the `google-services.json` file.
        *   Place this file in the `android/app` directory of your Flutter project.

4.  **API Key:**

    *   Replace `'YOUR_API_KEY'` in `home_screen.dart` with your actual Gemini API key.

    ```dart
    // In screens/home/home_screen.dart
    Future<void> _analyzeImageWithGemini(XFile image) async {
      const apiKey = 'YOUR_API_KEY'; // Replace with your key
      // ...
    }
    ```

    **Security Note:** For production, consider storing your API key more securely, such as using environment variables or a dedicated configuration service.

5.  **iOS Setup (CocoaPods):**

    *   Navigate to the `ios` directory:

        ```bash
        cd ios
        ```

    *   Install the necessary CocoaPods dependencies:

        ```bash
        pod install --repo-update
        ```

    *   **Important:** Always open the `Runner.xcworkspace` file in Xcode when working with the iOS project, not the `Runner.xcodeproj` file.

6.  **Run the App:**

    *   Connect an Android or iOS device, or start a simulator/emulator.
    *   Run the app from the project root directory:

        ```bash
        flutter run
        ```

## Project Structure

```
nutriai/
├── android/       # Android-specific code
├── ios/           # iOS-specific code (including Podfile and Runner.xcworkspace)
├── lib/
│   ├── app_localizations.dart # Localization setup
│   ├── color_scheme/
│   │   └── color_scheme.dart   # Color scheme for the app
│   ├── main.dart              # Main entry point of the app
│   ├── models/
│   │   └── user_data.dart     # Data model for user information
│   ├── provider/
│   │   └── user_provider.dart  # User data and state management
│   ├── resources/
│   │   └── auth_methods.dart   # Firebase authentication methods
│   ├── screens/
│   │   ├── ask_user/           # 19-step onboarding screens
│   │   │   ├── base_ask_user_screen.dart
│   │   │   ├── ask_user_step1.dart
│   │   │   ├── ...
│   │   │   └── ask_user_step19.dart
│   │   ├── home/
│   │   │   └── home_screen.dart   # Main screen with image analysis
│   │   ├── login/
│   │   │   ├── login_screen.dart
│   │   │   └── sign_up_screen.dart
│   │   └── onboarding/
│   │       └── onboarding_screen.dart
│   └── widgets/                # Reusable UI widgets
│       ├── card_widget.dart
│       ├── food_nutritions_widget.dart
│       ├── loading_indicator_widget.dart
│       ├── text_field_input.dart
│       └── upload_options_widget.dart
├── test/          # Unit and widget tests (not yet implemented)
├── pubspec.yaml   # Project dependencies and configuration
└── README.md      # This file
```

## Current Limitations

*   **Gemini API Response:** The current implementation relies on specific formatting from the Gemini API, which may change. Error handling and parsing logic might need adjustments based on future API updates.
*   **Image Analysis Accuracy:** The accuracy of nutritional data depends on the quality of the image and the capabilities of the Gemini API.
*   **Alternative APIs:** The app currently uses the Gemini API. Exploring and potentially integrating other food recognition APIs could enhance accuracy and provide more features.

## Future Development

*   **Enhanced Food Recognition:** Improve the accuracy and robustness of food recognition, potentially by integrating with other specialized food APIs or training a custom model.
*   **Nutritional Data Display:** Implement visually appealing and informative ways to present the nutritional data to the user, such as charts or graphs.
*   **Personalized Recommendations:** Develop algorithms to provide personalized dietary recommendations based on user data and goals.
*   **Progress Tracking:** Allow users to track their food intake, nutritional goals, and progress over time.
*   **Community Features:** Consider adding social features to allow users to connect, share recipes, and support each other.
*   **Gamification:** Introduce gamification elements (badges, rewards, challenges) to enhance user engagement.

## Contributing

Contributions to this project are welcome! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with clear, descriptive messages.
4.  Create a pull request to merge your changes into the main branch.

## Contact

For any questions or inquiries about this project, feel free to reach out:

*   **GitHub:** [zahidprvz](https://github.com/zahidprvz)
*   **LinkedIn:** [zahidprvz](https://www.linkedin.com/in/zahidprvz/)
*   **Email:** pervaizzahid55@gmail.com

## License

This project is currently under development and not yet licensed for public use.

**Disclaimer:** This app is under development. The information provided by the app is for informational purposes only and should not be considered medical advice. Consult with a qualified healthcare professional before making any significant changes to your diet or exercise routine.
