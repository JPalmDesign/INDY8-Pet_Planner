import 'package:flutter/material.dart';
import 'package:pet_planner/pages/forgot_password.dart';
import 'package:pet_planner/pages/schedule_page.dart';
import 'package:pet_planner/pages/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6E2C3),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('lib/images/dogcat.jpg'))),
              Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.fromLTRB(175, 175, 175, 75),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 50, fontFamily: 'robotoMedium'),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 40),
                        child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Username',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.account_circle_outlined))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                        child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.lock_outline))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(300, 2, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ForgotPassword();
                              }));
                            },
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'robotolight'),
                            ))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 30, 60, 0),
                        child: SizedBox(
                            height: 50,
                            width: 125,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFAEB2C5)),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SchedulePage();
                                  }));
                                },
                                child: const Text('Sign in',
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
                          child: const Text("Don't have an account? Sign up!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'robotoregular'))),
                    )
                  ]))
            ],
          );
        },
      ),
    );
  }
}
