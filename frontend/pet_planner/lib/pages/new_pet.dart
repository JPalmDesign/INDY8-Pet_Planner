import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:pet_planner/pages/pet_class.dart';

class NewPetPage extends StatefulWidget {
  final int clientId;

  const NewPetPage({
    Key? key,
    required this.clientId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewPetPageState();
}

class _NewPetPageState extends State<NewPetPage> {
  Future<Pet>? futurePet;
  final _formKey = GlobalKey<FormState>();
  TextEditingController petName = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController animalType = TextEditingController();

  @override
  void dispose() {
    petName.dispose();
    breed.dispose();
    color.dispose();
    dob.dispose();
    weight.dispose();
    animalType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFC6E2C3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
        leading: const CloseButton(
          color: Colors.black,
        ),
        title: const Text(
          "New Pet",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () async {
              await saveForm();

              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.done,
              color: Colors.black,
            ),
            label: const Text(
              "SAVE",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(child: Container(child: buildForm())));

  Form buildForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Row(children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: TextFormField(
                  controller: petName,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  onFieldSubmitted: (_) => saveForm(),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.pets),
                      labelText: "Pet Name",
                      hintText: "Enter the pet's name"),
                  validator: (petName) => petName != null && petName.isEmpty
                      ? "Name cannot be empty"
                      : null),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: TextFormField(
                  controller: dob,
                  onFieldSubmitted: (_) => saveForm(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Date of Birth",
                      hintText: "Ex: 2023-04-27"),
                  validator: (dob) => dob != null && dob.isEmpty
                      ? "Date of birth cannot be empty"
                      : null),
            )),
          ]),
          Row(
            children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: color,
                    onFieldSubmitted: (_) => saveForm(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Color",
                        hintText: "Enter the pet's color"),
                    validator: (color) => color != null && color.isEmpty
                        ? "Color cannot be empty"
                        : null),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: animalType,
                    onFieldSubmitted: (_) => saveForm(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Animal Type",
                        hintText: "Enter pet type"),
                    validator: (animalType) =>
                        animalType != null && animalType.isEmpty
                            ? "Pet type cannot be empty"
                            : null),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: breed,
                    onFieldSubmitted: (_) => saveForm(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Breed",
                        hintText: "Enter the pet's breed"),
                    validator: (breed) => breed != null && breed.isEmpty
                        ? "Breed cannot be empty"
                        : null),
              )),
            ],
          ),
          Row(children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: weight,
                  onFieldSubmitted: (_) => saveForm(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Weight",
                      hintText: "Enter the pet's weight"),
                  validator: (weight) => weight != null && weight.isEmpty
                      ? "Weight cannot be empty"
                      : null),
            )),
          ]),
        ]));
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      setState(() {
        futurePet = createPet(widget.clientId, petName.text, animalType.text,
            breed.text, weight.text, color.text, dob.text);
      });
    }
  }
}
