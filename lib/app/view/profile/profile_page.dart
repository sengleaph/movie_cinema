import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Seang Sengleaph';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 2,
                color: Colors.white, // Default color for the text
              ),
              children: [
                const TextSpan(
                  text: "Hello, my name is ",
                ),
                TextSpan(
                  text: name, // The Name variable
                  style: const TextStyle(color: Colors.red), // Make it red
                ),
                const TextSpan(
                  text:
                  ". And this application I created for testing around 2 days. I hope you enjoy and test it because I used it with the legend cinema API. In a short time, I think I should add a trailer video into this app. If you want me to add it, I would gladly add it for you. Thank you.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
