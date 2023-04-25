import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Tutorial (Send): https://docs.flutter.dev/cookbook/networking/send-data
// Tutorial (Get): https://docs.flutter.dev/cookbook/networking/fetch-data#2-make-a-network-request

class Feeding {
  final String foodType;
  final String foodBrand;
  final String quantity;
  final String measure;
  final String timeOfDay;
  final String medicine;
  final String dose;
  final String name;

  const Feeding(
      {required this.foodType,
      required this.foodBrand,
      required this.quantity,
      required this.measure,
      required this.timeOfDay,
      required this.medicine,
      required this.dose,
      required this.name});

  factory Feeding.fromJson(Map<String, dynamic> json) {
    return Feeding(
        foodType: json['foodType'],
        foodBrand: json['brand'],
        quantity: json['quantity'].toString(),
        measure: json['unitOfMeasure'],
        timeOfDay: json['timeOfDay'].toString(),
        medicine: json['medicines'],
        dose: json['dose'].toString(),
        name: json['name']);
  }
}

Future<Feeding> createFeeding(
    String foodType,
    String foodBrand,
    String quantity,
    String measure,
    String timeOfDay,
    String medicine,
    String dose,
    String name) async {
  final response =
      await http.post(Uri.parse('https://petplanner.azurewebsites.net/feeding'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'petId': 0,
            'foodType': foodType,
            'brand': foodBrand,
            'quantity': quantity,
            'unitOfMeasure': measure,
            'timeOfDay': timeOfDay,
            'medicines': medicine,
            'dose': dose,
            'name': name
          }));

  if (response.statusCode == 200) {
    return Feeding.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create feeding.');
  }
}
