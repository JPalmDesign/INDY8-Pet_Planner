import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_planner/pages/new_pet.dart';

import 'edit_client.dart';

class OldClientPage extends StatefulWidget {
  const OldClientPage({Key? key}) : super(key: key);

  @override
  OldClientPageState createState() => OldClientPageState();
}

class OldClientPageState extends State<OldClientPage> {
  List<dynamic> data = [];
  bool _isExpanded = false;
  int? _selectedIndex = null;
  double height = 105;

  Future<void> fetchClient() async {
    final response = await http
        .get(Uri.parse('https://petplanner.azurewebsites.net/client'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (mounted) {
        setState(() {
          data = parsed;
        });
      }
    } else {
      throw Exception('Failed to load client.');
    }
  }

  // maybe needs an editClient page?
  // once this is done, I think others will follow a similar format.
  /*  Future<void> editClient(
      int id,
      String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String address,
      String city,
      String state,
      String postalCode) async {
    final http.Response response = await http.put(
        Uri.parse('https://petplanner.azurewebsites.net/client/$id'),
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
  } */

  Future<void> deleteClient(int id) async {
    final http.Response response = await http
        .delete(Uri.parse('https://petplanner.azurewebsites.net/client/$id'));

    if (response.statusCode == 200) {
      setState(() {
        data.removeWhere((client) => client['id'] == id);
        fetchClient();
      });
    } else {
      throw Exception('Failed to delete client.');
    }
  }

  void expandButton(int index) {
    setState(() {
      if (_selectedIndex == index) {
        // If the currently selected item is tapped again, collapse it
        _isExpanded = false;
        _selectedIndex = null;
        height = 105.0;
      } else {
        // Otherwise, expand the selected item and collapse any previously selected item
        _isExpanded = true;
        _selectedIndex = index;
        height = 200.0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchClient();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Column(children: [
          SizedBox(
              height: 75,
              child: AppBar(
                  backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: const Padding(
                    padding: EdgeInsets.fromLTRB(700, 0, 0, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search, color: Colors.black)),
                    ),
                  ))),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Existing Clients",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
          SizedBox(height: 20),
          SingleChildScrollView(
              child: Container(
                  child: SizedBox(
                      height: 500,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (data[index] == null) {
                              return Container(
                                  child: Text('No data available'));
                            } else {
                              return Padding(
                                  padding: EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 1035,
                                    height: height,
                                    child: TextButton(
                                      onPressed: () => expandButton(index),
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFAEB2C5),
                                        shadowColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              const SizedBox(
                                                  height: 80, width: 10),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 20, 20, 20),
                                                  child: Column(children: [
                                                    Row(children: [
                                                      const Icon(
                                                        Icons.account_circle,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                          data.isNotEmpty
                                                              ? data[index][
                                                                      'firstName']
                                                                  .toString()
                                                              : '',
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'robotoMedium')),
                                                      const Text(" "),
                                                      Text(
                                                          data.isNotEmpty
                                                              ? data[index][
                                                                      'lastName']
                                                                  .toString()
                                                              : '',
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'robotoMedium')),
                                                      const SizedBox(width: 20),
                                                      IconButton(
                                                        icon: Icon(Icons.edit),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    EditClientPage(
                                                                        client:
                                                                            index)),
                                                          );
                                                        },
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        color: Colors.black,
                                                        onPressed: () {
                                                          deleteClient(
                                                              data[index]
                                                                  ['id']);
                                                        },
                                                      ),
                                                    ]),
                                                    Visibility(
                                                        visible: _isExpanded,
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                const Text(
                                                                    "Phone Number: ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'robotoMedium')),
                                                                Text(
                                                                    data.isNotEmpty
                                                                        ? data[index]['phoneNumber']
                                                                            .toString()
                                                                        : '',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'robotoMedium')),
                                                              ]),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                      "Address: ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color: Colors
                                                                              .black,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  Text(
                                                                      data.isNotEmpty
                                                                          ? data[index]['address']
                                                                              .toString()
                                                                          : '',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  Text(", "),
                                                                  Text(
                                                                      data.isNotEmpty
                                                                          ? data[index]['city']
                                                                              .toString()
                                                                          : '',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  const Text(
                                                                      ", ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  Text(
                                                                      data.isNotEmpty
                                                                          ? data[index]['state']
                                                                              .toString()
                                                                          : '',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  const Text(
                                                                      " ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium')),
                                                                  Text(
                                                                      data.isNotEmpty
                                                                          ? data[index]['zip']
                                                                              .toString()
                                                                          : '',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontFamily:
                                                                              'robotoMedium'))
                                                                ],
                                                              )
                                                            ]))
                                                  ]))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }
                          })))),

          // we might want this on each client box instead of just the one time (so we can keep trank of index(id))
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color(0xFFAEB2C5),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: const Text("New Pet"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NewPetPage()),
                    ),
                  ),
                ),
              ],
              icon: const Icon(Icons.add_circle_outline, color: Colors.black),
              iconSize: 50,
              offset: const Offset(170, 50),
            )
          ])
        ]));
  }

  Container noDataMessage() {
    return Container(
        color: Colors.white,
        child: Column(children: const [
          SizedBox(height: 100),
          Text('No data available')
        ]));
  }
}
