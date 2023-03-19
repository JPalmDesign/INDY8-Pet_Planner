import 'package:flutter/material.dart';
import 'package:pet_planner/pages/exist_client.dart';
import 'package:pet_planner/pages/new_app.dart';
import 'package:pet_planner/pages/new_pet.dart';
import 'package:pet_planner/pages/schedule_page.dart';

import 'forgot_password.dart';
import 'login_page.dart';

class NewClientPage extends StatelessWidget {
  const NewClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Column(children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  leading: PopupMenuButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    color: Color(0xFFAEB2C5),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: const Text("Logout"),
                        onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: const Text("Reset Password"),
                        onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ForgotPassword()),
                          ),
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.pets, color: Colors.black),
                    iconSize: 30,
                    offset: const Offset(0, 45),
                  ),
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
                "New Client",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(900, 0, 0, 0),
              child: SizedBox(
                  width: 200,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return (OldClientPage());
                      }));
                    },
                    backgroundColor: const Color(0xFFAEB2C5),
                    splashColor: Colors.white,
                    shape: const RoundedRectangleBorder(),
                    child: const Text("Existing Clients",
                        style: TextStyle(color: Colors.black)),
                  ))),
          SizedBox(height: 450),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color(0xFFAEB2C5),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: const Text("Home"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SchedulePage()),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: const Text("New Client"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NewClientPage()),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("New Appointment"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => NewAppointmentPage())),
                  ),
                ),
                PopupMenuItem(
                    value: 3,
                    child: Text("New Pet"),
                    onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => NewPetPage()),
                          ),
                        ))
              ],
              icon: const Icon(Icons.add_circle_outline, color: Colors.black),
              iconSize: 50,
              offset: const Offset(170, 50),
            )
          ]),
        ]));
  }
}
