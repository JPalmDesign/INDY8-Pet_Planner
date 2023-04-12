import 'package:flutter/material.dart';
import 'package:pet_planner/pages/pet_class.dart';
import 'package:pet_planner/pages/feeding_class.dart';

class ViewPetPage extends StatefulWidget {
  const ViewPetPage({super.key});

  @override
  State<ViewPetPage> createState() {
    return _ViewPetPageState();
  }
}

class _ViewPetPageState extends State<ViewPetPage> {
  late Future<Pet> futurepet;
  late Future<Feeding> futurefeed;

  @override
  void initState() {
    super.initState();
    futurepet = fetchPet();
    futurefeed = fetchFeeding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB2C5),
      body: Column(
        children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  iconTheme: IconThemeData(color: Colors.black),
                  actions: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(Icons.edit)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Icon(Icons.delete))
                  ],
                  title: const Center(
                      child: Text(
                    "View Pet",
                    style: TextStyle(color: Colors.black),
                  )))),
          Column(
            children: [
              const Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Icon(
                      Icons.pets,
                      size: 75,
                    )),
              ),
              const Text("Fluffy Smith",
                  style: TextStyle(
                      fontSize: 28, fontFamily: 'robotoBold')), // pet.petName
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: const [
                    Text("Breed: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robotoMedium')) // pet.breed
                  ])),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(children: const [
                    Text("Color: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robotoMedium')) // pet.color
                  ])),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: const [
                    Text("Play Group: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robotoMedium')), // pet.playGroup
                  ])),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: const [
                    Text("Date of Birth: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robotoMedium')) // pet.dob
                  ])),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(children: const [
                    Text("Weight: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robotoMedium')) // pet.weight
                  ])),
              /*
                      Add feeding/medicine in this file
              */
            ],
          ),
        ],
      ),
    );
  }
}