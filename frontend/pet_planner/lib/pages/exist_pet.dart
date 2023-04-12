import 'package:flutter/material.dart';
import 'package:pet_planner/pages/pet_view.dart';

class OldPetPage extends StatelessWidget {
  const OldPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Column(children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  iconTheme: IconThemeData(color: Colors.black),
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
                "Existing Pets",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
          const SizedBox(height: 50),
          Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: SizedBox(
                  width: 1035,
                  height: 100,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFAEB2C5),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(height: 80, width: 10),
                            Icon(
                              Icons.pets,
                              color: Colors.black,
                              size: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                                child: Text("Fluffy Smith", // pet.petName
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontFamily: 'robotoMedium')))
                          ],
                        ),
                      ],
                    ),
                    onPressed: () => Future(
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ViewPetPage()),
                      ),
                    ),
                  )))
        ]));
  }

  /* FutureBuilder<Pet> buildFutureBuilder() {
    return FutureBuilder<Pet>(
        future: _futurePet,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.petName);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        });
  } */
}
