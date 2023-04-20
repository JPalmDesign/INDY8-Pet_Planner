import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Tutorial (Send): https://docs.flutter.dev/cookbook/networking/send-data
// Tutorial (Get): https://docs.flutter.dev/cookbook/networking/fetch-data#2-make-a-network-request

/* Future<Client> fetchClient() async {
  final response =
      await http.get(Uri.parse('https://petplanner.azurewebsites.net/client'));

  if (response.statusCode == 200) {
    return Client.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load client.');
  }
} */

class Client {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  //final String email;
  final String address;
  final String city;
  final String state;
  final String postalCode;
  // final bool isPhone;
  //final bool isEmail

  const Client({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    //required this.email,
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
        phoneNumber: json['phoneNumber'].toString(),
        //email: json['email'],
        address: json['addressLine1'],
        city: json['city'],
        state: json['state'],
        postalCode: json['postalCode'].toString());
  }
}

Future<Client> createClient(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String address,
    String city,
    String state,
    String postalCode) async {
  final response =
      await http.post(Uri.parse('https://petplanner.azurewebsites.net/client'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'firstName': firstName,
            'middleInitial': "",
            'lastName': lastName,
            'phoneNumber': phoneNumber,
            'email': email,
            'addressLine1': address,
            'addressLine2': "",
            'city': city,
            'state': state,
            'zip': postalCode
          }));

  if (response.statusCode == 200) {
    // 201 = CREATED
    return Client.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create client.');
  }
}
