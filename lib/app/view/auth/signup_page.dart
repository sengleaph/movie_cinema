import 'package:flutter/material.dart';

import '../component/my_button.dart';
import '../component/my_text_field.dart';
import '../navigation/navigation_bar.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? togglePage;
  SignUpPage({super.key, required this.togglePage,});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Sign-up function

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Image.asset("assets/images/login_image.png",
              //       height: MediaQuery.of(context).size.height * .30),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Account_",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please Sign up to create account",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                        controller: nameController,
                        hintText: "Name",
                        obscureText: false),
                    const SizedBox(height: 10),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false),
                    const SizedBox(height: 10),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true),
                    const SizedBox(height: 10),
                    const Text(
                      "Confirm Password",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNavigationBar(),));
                    }, text: 'Create Account'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/facebook.png", height: 50),
                        Image.asset("assets/images/google.png", height: 50),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ready have account?",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(togglePage: () {  },),
                                )),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
