import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Pet> createPet(
  String petName,
  String breed,
  String color,
  String weight,
  String playGroup,
  String dob,
) async {
  final response = await http.post(Uri.parse('url')), body;
  jsonEncode(<String, String>{
    'petName': petName,
    // add the rest later
  });

  if (response.statusCode == 201) {
    return Pet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create pet.');
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
      petName: json['pettName'],
      breed: json['breed'],
      weight: json['weight'],
      color: json['color'],
      playGroup: json['playGroup'],
      dob: json['dob'],
    );
  }
}
