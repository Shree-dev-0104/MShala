import 'package:flutter/material.dart';
import 'package:medicalshala/components/my_text_field.dart';
import 'package:medicalshala/pages/appoitment_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  // logo
                  Image.asset(
                    'assets/medicalshala_logo.png',
                    height: 60,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Join Our Healthcare Network",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),

                  const Text(
                    "Register to Continue",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const MyTextField(hintText: "Full Name"),
                  const MyTextField(hintText: "Specialization"),
                  const MyTextField(hintText: "Hospital's / Clinic's Name"),
                  const MyTextField(hintText: "Email"),
                  const MyTextField(hintText: "Phone Number"),
                  const MyTextField(
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const MyTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),

                  // Terms and conditions checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // Register Button
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppointmentPage(),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Or sign in with
                  const SizedBox(height: 5),
                  const Text(
                    "Or Sign In with",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Google button
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 85,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/google.png',
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ),

                        // Apple button
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 85,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.apple,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Already have an account
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an Account? ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
