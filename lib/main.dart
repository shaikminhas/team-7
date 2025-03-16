import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const FitCart());
}

class FitCart extends StatelessWidget {
  const FitCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIT CART',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 21, 42, 73),
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => const SplashScreen(), 
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
