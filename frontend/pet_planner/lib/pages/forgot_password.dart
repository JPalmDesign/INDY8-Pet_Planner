import 'package:flutter/material.dart';
import 'package:pet_planner/pages/login_page.dart';
import 'package:pet_planner/pages/sign_up.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 700,
                  width: 700,
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Text(
                              "Reset your password",
                              style: TextStyle(
                                  fontSize: 50, fontFamily: 'robotoMedium'),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(50, 75, 50, 0),
                            child: Text(
                                "Enter the email address associated with your account and we'll send you a link to reset the password.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'robotoRegular')),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(80, 100, 80, 40),
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Email',
                                      prefixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.mail_outline))))),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(60, 15, 60, 0),
                              child: SizedBox(
                                  height: 50,
                                  width: 175,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFAEB2C5)),
                                      onPressed: () {},
                                      child: const Text('Continue',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'robotomedium'))))),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SignUp();
                                  }));
                                },
                                child: const Text(
                                    "Don't have an account? Sign up!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'robotoregular'))),
                          ),
                        ],
                      )),
                ))));
  }
}
