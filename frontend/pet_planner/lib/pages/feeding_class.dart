import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Tutorial (Send): https://docs.flutter.dev/cookbook/networking/send-data
// Tutorial (Get): https://docs.flutter.dev/cookbook/networking/fetch-data#2-make-a-network-request

Future<Feeding> fetchFeeding() async {
  final response =
      await http.get(Uri.parse('https://petplanner.azurewebsites.net/feeding'));

  if (response.statusCode == 200) {
    return Feeding.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pet');
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

Future<Feeding> createFeeding(
    String foodType,
    String foodBrand,
    String quantity,
    String measure,
    String timeOfDay,
    String medicine,
    String dose) async {
  final response =
      await http.post(Uri.parse('https://petplanner.azurewebsites.net/feeding'),
          headers: <String, String>{
            'Content-Type': 'test/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{'foodType': foodType}));

  if (response.statusCode == 201) {
    // 201 = CREATED
    return Feeding.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create pet.');
  }
}
