import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Feeding> createFeeding(
  String foodType,
  String foodBrand,
  String color,
  String weight,
  String playGroup,
  String dob,
) async {
  final response = await http.post(Uri.parse('url')), body;
  jsonEncode(<String, String>{
    'foodType': foodType,
    // add the rest later
  });

  if (response.statusCode == 201) {
    return Feeding.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create pet.');
  }
}

class Feeding {
  final String foodType;
  final String foodBrand;
  final String quantity;
  final String measure;
  final String timeOfDay;
  final String medicine;
  final String dose;

  const Feeding(
      {required this.foodType,
      required this.foodBrand,
      required this.quantity,
      required this.measure,
      required this.timeOfDay,
      required this.medicine,
      required this.dose});

  factory Feeding.fromJson(Map<String, dynamic> json) {
    return Feeding(
        foodType: json['foodType'],
        foodBrand: json['foodBrand'],
        quantity: json['quantity'],
        measure: json['measure'],
        timeOfDay: json['timeOfDay'],
        medicine: json['medicine'],
        dose: json['dose']);
  }
}
