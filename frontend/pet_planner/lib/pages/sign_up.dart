import 'package:flutter/material.dart';
import 'package:pet_planner/pages/login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                      child: Image.asset('lib/images/dogcat2.jpg'))),
              Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.fromLTRB(50, 100, 50, 75),
                        child: Text(
                          "Create your account",
                          style: TextStyle(
                              fontSize: 50, fontFamily: 'robotoMedium'),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 40),
                        child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Email',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.mail_outline))))),
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
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 40),
                        child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.lock_outline))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 40),
                        child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Confirm Password',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.lock_outline))))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(60, 15, 60, 0),
                        child: SizedBox(
                            height: 50,
                            width: 175,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFAEB2C5)),
                                onPressed: () {},
                                child: const Text('Create account',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'robotomedium'))))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          },
                          child: const Text("Return to login",
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
