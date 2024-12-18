import 'package:flutter/material.dart';
import '../component/my_button.dart';

import '../component/my_text_field.dart';
import '../navigation/navigation_bar.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePage;
  LoginPage({
    super.key,
    required this.togglePage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              Center(
                child: Image.asset("Assets/images/login_image.png",
                    height: MediaQuery.of(context).size.height * .35),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login_",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Login to continue to our app.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forget password action
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    MyButton(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNavigationBar(),));
                    }, text: 'Login'),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/facebook.png", height: 50),
                        Image.asset("assets/images/google.png", height: 50),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(togglePage: () {  },),
                                )),
                            child: Text(
                              "Sign Up",
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
