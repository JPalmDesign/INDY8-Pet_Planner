import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Client> createClient(
  String firstName,
  String lastName,
  String phoneNumber,
  String email,
  String address,
  String city,
  String state,
  String postalCode,
  //bool isPhone,
  //bool isEmail
) async {
  final response = await http.post(Uri.parse('url')), body;
  jsonEncode(<String, String>{
    'firstName': firstName,
    'lastName': lastName,
    // add the rest later
  });

  if (response.statusCode == 201) {
    return Client.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create client.');
  }
}

class Client {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String state;
  final String postalCode;
  // final bool isPhone;
  //final bool isEmail;

  const Client({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    //required this.isEmail,
    //required this.isPhone
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      // isPhone: json['isPhone'],
      //isEmail: json['isEmail'],
    );
  }
}
