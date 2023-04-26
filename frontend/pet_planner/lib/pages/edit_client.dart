import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_planner/pages/client_class.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditClientPage extends StatefulWidget {
  final Client client;

  const EditClientPage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  _EditClientPageState createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameContr = TextEditingController();
  TextEditingController lastNameContr = TextEditingController();
  TextEditingController phoneNumContr = TextEditingController();
  TextEditingController emailContr = TextEditingController();
  TextEditingController streetAddressContr = TextEditingController();
  TextEditingController cityContr = TextEditingController();
  TextEditingController stateContr = TextEditingController();
  TextEditingController postalCodeContr = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameContr = TextEditingController(text: widget.client.firstName);
    lastNameContr = TextEditingController(text: widget.client.lastName);
    phoneNumContr =
        TextEditingController(text: widget.client.phoneNumber.toString());
    emailContr = TextEditingController(text: widget.client.email);
    streetAddressContr = TextEditingController(text: widget.client.address);
    cityContr = TextEditingController(text: widget.client.city);
    stateContr = TextEditingController(text: widget.client.state);
    postalCodeContr =
        TextEditingController(text: widget.client.postalCode.toString());
  }

  @override
  void dispose() {
    firstNameContr.dispose();
    lastNameContr.dispose();
    phoneNumContr.dispose();
    emailContr.dispose();
    streetAddressContr.dispose();
    cityContr.dispose();
    stateContr.dispose();
    postalCodeContr.dispose();
    super.dispose();
  }

  Future<void> editClient(
      //int id,
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String address,
      String city,
      String state,
      String postalCode) async {
    final http.Response response = await http.put(
        Uri.parse('https://petplanner.azurewebsites.net/client/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'email': email,
          'address': address,
          'city': city,
          'state': state,
          'zip': postalCode
        }));

    if (response.statusCode == 200) {
      // The pet was updated successfully, do something if needed
    } else {
      throw Exception('Failed to edit pet.');
    }
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final updatedClient = Client(
        firstName: firstNameContr.text,
        lastName: lastNameContr.text,
        phoneNumber: phoneNumContr.text,
        email: emailContr.text,
        address: streetAddressContr.text,
        city: cityContr.text,
        state: stateContr.text,
        postalCode: postalCodeContr.text,
      );
      // Call the API to update the client
      await editClient(
          updatedClient.firstName,
          updatedClient.lastName,
          updatedClient.phoneNumber,
          updatedClient.email,
          updatedClient.address,
          updatedClient.city,
          updatedClient.state,
          updatedClient.postalCode);
      // Navigate back to the client details page
      Navigator.pop(context);
    }
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
            "New Client",
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
            ),
          ]),
      body: Container(
        child: (buildForm()),
      ));

  Form buildForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Row(
            children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: TextFormField(
                    controller: firstNameContr,
                    onSaved: (_) => saveForm(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First Name",
                        hintText: 'Enter your first name'),
                    validator: (firstName) =>
                        firstName != null && firstName.isEmpty
                            ? "First name cannot be empty"
                            : null),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: TextFormField(
                    controller: lastNameContr,
                    onSaved: (_) => saveForm(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Last Name",
                        hintText: 'Enter your last name'),
                    validator: (lastName) =>
                        lastName != null && lastName.isEmpty
                            ? "Last name cannot be empty"
                            : null),
              )),
            ],
          ),
          Row(children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: emailContr,
                  onSaved: (_) => saveForm(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Email Address",
                      hintText: 'Enter your email'),
                  validator: (email) => email != null && email.isEmpty
                      ? "Email cannot be empty"
                      : null),
            )),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: phoneNumContr,
                  onSaved: (_) => saveForm(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_outlined),
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                      hintText: 'Enter your phone number'),
                  validator: (phone) => phone != null && phone.isEmpty
                      ? "Phone number cannot be empty"
                      : null),
            )),
          ]),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: SizedBox(
                    width: 1135,
                    child: TextFormField(
                        controller: streetAddressContr,
                        onSaved: (_) => saveForm(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Address",
                            hintText:
                                'Street address, P.O. box, apartment, etc.'),
                        validator: (address) =>
                            address != null && address.isEmpty
                                ? "Address cannot be empty"
                                : null),
                  )),
            ],
          ),
          Row(children: [
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 400,
                    child: TextFormField(
                        controller: cityContr,
                        onSaved: (_) => saveForm(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "City",
                            hintText: 'Enter your city name'),
                        validator: (city) => city != null && city.isEmpty
                            ? "City name cannot be empty"
                            : null),
                  )),
            ),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 400,
                    child: TextFormField(
                        controller: stateContr,
                        onSaved: (_) => saveForm(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "State",
                            hintText: 'Enter your state'),
                        validator: (state) => state != null && state.isEmpty
                            ? "State cannot be empty"
                            : null),
                  )),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  controller: postalCodeContr,
                  onSaved: (_) => saveForm(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Postal Code",
                      hintText: 'Enter your postal code'),
                  validator: (zipCode) => zipCode != null && zipCode.isEmpty
                      ? "Postal code cannot be empty"
                      : null),
            )),
          ]),
        ]));
  }
}
