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

## Installing

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/l_mobilesales_mini.git

2. **Navigate to the project directory:**

cd l_mobilesales_mini


3. **Install the dependencies:**

flutter pub get

4. **Set up Firebase:**

-Add your Firebase project configuration files as mentioned in the prerequisites.

-Initialize Firebase in your app by calling Firebase.initializeApp() before running the app.
5. **Run the app:**
For Android or iOS, run the app on a device or emulator:

flutter run

### Assumptions
-Firebase Authentication: The app assumes that users are authenticated using Firebase Authentication with an email and password.

-Cloud Firestore: Firestore is assumed to store sales data such as daily summaries, performance charts, and inventory status.

-Device Permissions: For features like notifications or camera, permissions are assumed to be handled by Flutter plugins (e.g., firebase_messaging, image_picker).

### Architecture Decisions

1. **State Management**
We use a combination of Provider and Riverpod for state management:

Provider is used to manage the DashboardController state and propagate data across the app.

Riverpod is used for dependency injection and advanced state management, enabling scalability.

2. **Firebase for Backend**
Firebase was chosen for its ease of use and strong Flutter integration:

Authentication (with email/password)

Firestore for storing sales data and user activity

Firebase Storage for assets (future use)

3. **Routing and Navigation**
The app uses Named Routes for easier navigation.

Defined in a separate AppRoutes class.

Navigation is managed using Navigator.pushReplacementNamed.

4. **UI Design**
The UI follows Material Design principles with a mobile-first responsive layout:

Uses SingleChildScrollView and Column for adaptive sizing.

Reusable widgets include:

DashboardHeader

DailySummaryCard

PerformanceChart

InventoryStatusSummary

5. **Authentication Flow**
Users log in with email and password.

If authentication fails, error messages are shown.

On success, users are redirected to the Dashboard.

6. **Error Handling**
Basic error catching during login and registration.

Error messages are displayed on the UI.

Loading indicators (CircularProgressIndicator) show during operations for better UX.

### Conclusion
The l_mobilesales_mini app provides a robust and scalable foundation for a mobile sales application. It integrates Firebase for backend services, uses Riverpod and Provider for state management, and features a clean UI based on Material Design principles.

