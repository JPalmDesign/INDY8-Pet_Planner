import 'package:flutter/material.dart';
import 'package:pet_planner/pages/new_app.dart';
import 'package:pet_planner/pages/new_pet.dart';
import 'package:pet_planner/pages/schedule_page.dart';

import 'forgot_password.dart';
import 'login_page.dart';

class OldClientPage extends StatelessWidget {
  const OldClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Column(children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  title: const Padding(
                    padding: EdgeInsets.fromLTRB(700, 0, 0, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search, color: Colors.black)),
                    ),
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Existing Clients",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
        ]));
  }
}
