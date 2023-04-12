import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:pet_planner/pages/client_class.dart';

class NewClientPage extends StatefulWidget {
  const NewClientPage({super.key});

  @override
  State<NewClientPage> createState() {
    return _NewClientPageState();
  }
}

class _NewClientPageState extends State<NewClientPage> {
  Future<Client>? _futureClient;
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameContr = TextEditingController();
  TextEditingController lastNameContr = TextEditingController();
  TextEditingController phoneNumContr = TextEditingController();
  TextEditingController emailContr = TextEditingController();
  TextEditingController streetAddressContr = TextEditingController();
  TextEditingController cityContr = TextEditingController();
  TextEditingController stateContr = TextEditingController();
  TextEditingController postalCodeContr = TextEditingController();
  String selectedValue = "United States";
  bool? isPhone = false;
  bool? isEmail = false;

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
              onPressed: () {
                setState(() {
                  _futureClient = createClient(firstNameContr.text
                      //lastNameContr.text,
                      //phoneNumContr.text,
                      //emailContr.text,
                      // streetAddressContr.text,
                      // cityContr.text,
                      // stateContr.text,
                      // postalCodeContr.text
                      );
                });
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
        child: (_futureClient == null ? buildForm() : buildFutureBuilder()),
      ));

  Form buildForm() {
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(
            children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: TextFormField(
                    controller: firstNameContr,
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
            Flexible(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(children: [
                      const Text("Preferred Contact Type",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      CheckboxListTile(
                          value: isPhone,
                          title: const Text("Phone",
                              style: TextStyle(fontSize: 22)),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: const Color(0xFFAEB2C5),
                          onChanged: (phoneContact) {
                            setState(() {
                              isPhone = phoneContact;
                            });
                          }),
                      CheckboxListTile(
                          value: isEmail,
                          title: const Text("Email",
                              style: TextStyle(fontSize: 22)),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: const Color(0xFFAEB2C5),
                          onChanged: (emailContact) {
                            setState(() {
                              isEmail = emailContact;
                            });
                          })
                    ])))
          ]),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: SizedBox(
                    width: 1135,
                    child: TextFormField(
                        controller: streetAddressContr,
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
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        labelText: "Select your country",
                        labelStyle: TextStyle(fontSize: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFAEB2C5)))),
                    validator: (country) =>
                        country == null ? "Select a country" : null,
                    value: selectedValue,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    items: dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                  )),
            ),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 400,
                    child: TextFormField(
                        controller: cityContr,
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "United States", child: Text("United States")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  FutureBuilder<Client> buildFutureBuilder() {
    return FutureBuilder<Client>(
        future: _futureClient,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.firstName);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        });
  }
}
