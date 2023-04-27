import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_planner/pages/new_feed.dart';

import 'new_app.dart';

class OldFeedingPage extends StatefulWidget {
  const OldFeedingPage({Key? key}) : super(key: key);

  @override
  OldFeedingPageState createState() => OldFeedingPageState();
}

class OldFeedingPageState extends State<OldFeedingPage> {
  List<dynamic> data = [];
  bool _isExpanded = false;
  int? _selectedIndex;
  double height = 105;

  Future<void> fetchFeeding() async {
    final response = await http
        .get(Uri.parse('https://petplanner.azurewebsites.net/feeding'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (mounted) {
        setState(() {
          data = parsed;
        });
      }
    } else {
      throw Exception('Failed to load feeding.');
    }
  }

  Future<void> deleteFeeding(int id) async {
    final http.Response response = await http
        .delete(Uri.parse('https://petplanner.azurewebsites.net/feeding/$id'));

    if (response.statusCode == 200) {
      setState(() {
        data.removeWhere((feeding) => feeding['id'] == id);
        fetchFeeding();
      });
    } else {
      throw Exception('Failed to delete feeding.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFeeding();
  }

  @override
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
                "Existing Feedings",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
          const SizedBox(height: 20),
          SingleChildScrollView(
              child: Container(
                  child: SizedBox(
                      height: 600,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            void expandButton() {
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
                                  height = 270.0;
                                }
                              });
                            }

                            return Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  width: 1035,
                                  height: height,
                                  child: TextButton(
                                    onPressed: () => expandButton(),
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFAEB2C5),
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
                                                      Icons.medication_outlined,
                                                      color: Colors.black,
                                                      size: 30,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                        data.isNotEmpty
                                                            ? data[index]
                                                                    ['name']
                                                                .toString()
                                                            : '',
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'robotoMedium')),
                                                    const SizedBox(width: 20),
                                                    /* IconButton(
                                                      icon: const Icon(
                                                          Icons.edit),
                                                      onPressed: () {},
                                                      color: Colors.black,
                                                    ), */
                                                    //  const SizedBox(width: 5),
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      color: Colors.black,
                                                      onPressed: () {
                                                        deleteFeeding(
                                                            data[index]['id']);
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
                                                                  "Feeding ID: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'id']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Food Type: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'foodType']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Brand: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'brand']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Quantity: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'quantity']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Unit of Measure: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty &&
                                                                          data[index]['unitOfMeasure'] !=
                                                                              null
                                                                      ? data[index]
                                                                              [
                                                                              'unitOfMeasure']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Time of Day: ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty &&
                                                                          data[index]['timeOfDay'] !=
                                                                              null
                                                                      ? data[index]
                                                                              [
                                                                              'timeOfDay']
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
                                                            Row(children: [
                                                              const Text(
                                                                  "Medicines(Optional): ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'medicines']
                                                                          .toString()
                                                                      : '',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              const Text(" ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                      fontFamily:
                                                                          'robotoMedium')),
                                                              Text(
                                                                  data.isNotEmpty
                                                                      ? data[index]
                                                                              [
                                                                              'dose']
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
                                                          ])),
                                                ]))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          })))),
        ]));
  }
}
