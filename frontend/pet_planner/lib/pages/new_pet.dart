import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:pet_planner/pages/pet_class.dart';

class NewPetPage extends StatefulWidget {
  const NewPetPage({super.key});

  @override
  State<NewPetPage> createState() {
    return _NewPetPageState();
  }
}

class _NewPetPageState extends State<NewPetPage> {
  Future<Pet>? _futurePet;
  final _formKey = GlobalKey<FormState>();
  TextEditingController petName = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController playGroup = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController weight = TextEditingController();

  @override
  void dispose() {
    petName.dispose();
    breed.dispose();
    color.dispose();
    playGroup.dispose();
    dob.dispose();
    weight.dispose();
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
            onPressed: saveForm,
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
      body: Container(
          child: (_futurePet == null) ? buildForm() : buildFutureBuilder()));

  Form buildForm() {
    return Form(
        key: _formKey,
        child: Column(children: [
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
                      hintText: "Enter the pet's date of birth"),
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
                    validator: (email) => email != null && email.isEmpty
                        ? "Color cannot be empty"
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
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: SizedBox(
                    width: 1135,
                    child: TextFormField(
                        controller: playGroup,
                        onFieldSubmitted: (_) => saveForm(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Play Group",
                            hintText: "Enter the pet's play group"),
                        validator: (playGroup) =>
                            playGroup != null && playGroup.isEmpty
                                ? "Play group cannot be empty"
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
    setState(() {
      _futurePet = createPet(petName.text, breed.text, weight.text, color.text,
          playGroup.text, dob.text);
    });
  }

  FutureBuilder<Pet> buildFutureBuilder() {
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
  }
}
