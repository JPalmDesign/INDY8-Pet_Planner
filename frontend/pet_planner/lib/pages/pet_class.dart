import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Tutorial (Send): https://docs.flutter.dev/cookbook/networking/send-data
// Tutorial (Get): https://docs.flutter.dev/cookbook/networking/fetch-data#2-make-a-network-request

Future<Pet> fetchPet() async {
  final response =
      await http.get(Uri.parse('https://petplanner.azurewebsites.net/pet'));

  if (response.statusCode == 200) {
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pet');
  }
}

class Pet {
  final String petName;
  final String breed;
  final String color;
  final String weight;
  final String playGroup;
  final String dob;

  const Pet({
    required this.petName,
    required this.breed,
    required this.color,
    required this.weight,
    required this.playGroup,
    required this.dob,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      petName: json['petName'],
      breed: json['breed'],
      weight: json['weight'],
      color: json['color'],
      playGroup: json['playGroup'],
      dob: json['dob'],
    );
  }
}

Future<Pet> createPet(String petName, String breed, String weight, String color,
    String playGroup, String dob) async {
  final response =
      await http.post(Uri.parse('https://petplanner.azurewebsites.net/pet'),
          headers: <String, String>{
            'Content-Type': 'test/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'petName': petName,
            'breed': breed,
            'weight': weight,
            'color': color,
            'playGroup': playGroup,
            'dob': dob
          }));

  if (response.statusCode == 201) {
    // 201 = CREATED
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create pet.');
  }
}
