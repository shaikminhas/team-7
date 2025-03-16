import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Avatar
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/profile.png"),  
            ),
            const SizedBox(height: 10),
            
            // User Name
            const Text(
              "Mahi", // Replace with user name
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            
            // User Bio
            const Text(
              "Fitness Enthusiast | Gym Freak 💪", // Replace with user bio
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Profile Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    profileDetail(Icons.email, "hppyyy@email.com"),
                    const Divider(),
                    profileDetail(Icons.phone, "+91 9876543210"),
                    const Divider(),
                    profileDetail(Icons.location_on, "hydrabad, India"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                profileButton(Icons.edit, "Edit Profile", Colors.blue, () {
                  // Edit profile action
                }),
                profileButton(Icons.logout, "Logout", Colors.red, () {
                  // Logout action
                  Navigator.pushReplacementNamed(context, '/login');
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Profile Details (Icon + Text)
  Widget profileDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  // Widget for Profile Buttons (Icon + Text)
  Widget profileButton(IconData icon, String text, Color color, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
