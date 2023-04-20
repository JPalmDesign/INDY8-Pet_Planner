import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_planner/pages/client_class.dart';

class ViewClientPage extends StatefulWidget {
  const ViewClientPage({Key? key}) : super(key: key);

  @override
  _ViewClientPageState createState() => _ViewClientPageState();
}

class _ViewClientPageState extends State<ViewClientPage> {
  List<dynamic> data = [];

  Future<void> fetchClient() async {
    final response = await http
        .get(Uri.parse('https://petplanner.azurewebsites.net/client'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      setState(() {
        data = parsed;
      });
    } else {
      throw Exception('Failed to load client.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAEB2C5),
      body: Column(
        children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  iconTheme: const IconThemeData(color: Colors.black),
                  actions: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(Icons.edit)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Icon(Icons.delete))
                  ],
                  title: const Center(
                      child: Text(
                    "View Client",
                    style: TextStyle(color: Colors.black),
                  )))),
          SingleChildScrollView(
              child: ListView.builder(
                  addRepaintBoundaries: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const Center(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                              child: Icon(
                                Icons.account_circle,
                                size: 75,
                              )),
                        ),
                        Text(
                            data.isNotEmpty
                                ? data[index]['firstName']
                                : '', // client.firstName, client.lastName
                            style: TextStyle(
                                fontSize: 28, fontFamily: 'robotoBold')),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("Pet(s): ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')) // will display pets
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: [
                              Text("Phone Number: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'robotoMedium')),
                              Text(data.isNotEmpty
                                  ? data[0]['phoneNumber'].toString()
                                  : '') // client.phoneNumber
                            ])),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("Email Address: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')) // client.email
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("Street Address: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')), // client.address
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("City: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')) // client.city
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("State: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')) // client.state
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("Postal Code: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'robotoMedium')) // client.postalCode
                            ])),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: const [
                              Text("Preferred Contact Method: ",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'robotoMedium'))
                            ]))
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
