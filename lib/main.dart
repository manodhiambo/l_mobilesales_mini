import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'firebase_options.dart';
import 'presentation/screens/login_screen.dart'; // Login screen import
import 'presentation/screens/home_screen.dart'; // Home screen import
import 'presentation/controllers/dashboard_controller.dart'; // DashboardController import
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        title: 'Mobile Sales App',
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? '/login' // If the user is not logged in, go to login screen
            : '/home', // If the user is logged in, go to home screen
        routes: {
          '/home': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(), // Make sure the LoginScreen widget is implemented
        },
      ),
    );
  }
}
