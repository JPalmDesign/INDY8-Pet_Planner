import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Tutorial (Send): https://docs.flutter.dev/cookbook/networking/send-data
// Tutorial (Get): https://docs.flutter.dev/cookbook/networking/fetch-data#2-make-a-network-request

class Pet {
  //final String clientId;
  final String petName;
  final String animalType;
  final String breed;
  final String color;
  final String weight;
  final String dob;

  const Pet({
    // required this.clientId,
    required this.petName,
    required this.animalType,
    required this.breed,
    required this.color,
    required this.weight,
    required this.dob,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      //clientId: json['clientId'].toString(),
      petName: json['name'],
      animalType: json['animalType'],
      breed: json['breed'],
      color: json['color'],
      weight: json['weight'].toString(),
      dob: json['dateOfBirth'].toString(),
    );
  }
}

Future<Pet> createPet(String petName, String animalType, String breed,
    String weight, String color, String dob) async {
  final response =
      await http.post(Uri.parse('https://petplanner.azurewebsites.net/pet'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'clientId': 1,
            'name': petName,
            'animalType': animalType,
            'breed': breed,
            'color': color,
            'weight': weight,
            'playgroup': "group 1",
            'dateOfBirth': dob
          }));
  if (response.statusCode == 200) {
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create pet.');
  }
}
