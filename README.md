# l_mobilesales_mini

A mobile sales application built using Flutter. It allows users to authenticate, view a dashboard, and perform sales-related activities like viewing summaries, charts, and inventory statuses.
i
## Features

- User Authentication with Firebase (Login, Register, Reset Password)
- Dashboard with daily summaries, performance charts, and inventory statuses
- Responsive design for both mobile and web platforms
- Integration with Firebase for backend support (Authentication, Firestore)

## Setup Instructions

Follow these steps to set up the `l_mobilesales_mini` app locally on your machine.

### Prerequisites

1. **Flutter**: Ensure that you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
   
2. **Firebase Project**: 
   - Create a Firebase project if you haven’t already by visiting [Firebase Console](https://console.firebase.google.com/).
   - Enable Firebase Authentication (Email/Password) and Firestore in the Firebase console.
   - Download the `google-services.json` file for Android and/or `GoogleService-Info.plist` for iOS and place them in the respective directories:
     - For Android: `android/app/`
     - For iOS: `ios/Runner/`

3. **Firebase SDK for Flutter**: Make sure that you have added the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  firebase_auth: ^3.3.3
  firebase_core: ^1.10.6
  cloud_firestore: ^3.1.5
  provider: ^6.0.3
  flutter_riverpod: ^1.0.0
  flutter:
    sdk: flutter


### Installing
<ol>
<li>Clone the repository:</li>

git clone https://github.com/yourusername/l_mobilesales_mini.git

<li>Navigate to the project directory:</li>
cd l_mobilesales_mini

<li>Install the dependencies:</li>
flutter pub get

<li>Set up Firebase:</li>
<ul>
<li>Add your Firebase project configuration files as mentioned in the prerequisites.</li>
<li>Initialize Firebase in your app by calling Firebase.initializeApp() before running the app.</li>
</ul>

<li>Run the app:</li>
For Android or iOS, you can run the app on a device or emulator:

flutter run
</ol>

<br><br>
### Assumptions
<ul>
<li>Firebase Authentication: The app assumes that users are authenticated using Firebase Authentication with an email and password.</li>
<li>Cloud Firestore: The app assumes Firestore will be used to store sales data such as daily summaries, performance charts, and inventory status.</li>
<li>Device Permissions: For certain features (like notifications or camera), device permissions are assumed to be handled by Flutter plugins (e.g., firebase_messaging, image_picker).</li>
</ul>

<br><br>

### Architecture Decisions

<ol>
<li>State Management</li>
<p>We have used a combination of Provider and Riverpod for state management. This provides a clean and flexible way to manage application state:</p>
<ul>
<li>Provider: We use Provider to manage the DashboardController state and propagate data across the app</li>
<li>Riverpod: We utilize Riverpod for dependency injection and more advanced state management, ensuring that we can easily scale the app with more state providers.</li>
</ul>

<li>Routing and Navigation</li>
<p>The app uses Named Routes for navigation between screens, which simplifies the management of navigation and URL mapping (especially when the app grows). The routes are defined in a separate AppRoutes class, and navigation is managed by Navigator.pushReplacementNamed for seamless transitions.</p>
<li>UI Design</li>
<p>The app adopts a responsive design approach:</p>
<ul>
<li>A mobile-first design is used with SingleChildScrollView and Column widgets to ensure that content adjusts well on different screen sizes.</li>
<li>Material Design principles are followed to ensure a clean and modern UI with familiar patterns for the user.</li>
<li>The app’s UI includes various widgets such as DashboardHeader, DailySummaryCard, PerformanceChart, and InventoryStatusSummary, all of which allow for modularity and ease of maintenance.</li>
</ul>

<br><br>
<li>Authentication Flow</li>
<p>The app uses Firebase Authentication for user login and registration:</p>
<ul>
<li>The login screen allows users to enter their credentials (email and password), and if authentication fails, an error message is displayed.</li>
<li>After a successful login, users are navigated to the home screen/dashboard, where sales-related data is displayed.</li>
</ul>

<li>Error Handling</li>
<ul>
<li>Basic error handling is incorporated in the login and registration flows. When an error occurs (e.g., wrong credentials), the error is caught and displayed on the UI.</li>
<li>A loading indicator (CircularProgressIndicator) is shown during data fetching or authentication processes to enhance user experience.</li>
</ul>
</ol>

### Conclusion
<p>The l_mobilesales_mini app provides a robust and scalable foundation for a sales mobile application. It integrates Firebase for authentication and data storage, uses Riverpod and Provider for state management, and offers a clean UI following Material Design principles.</p>
