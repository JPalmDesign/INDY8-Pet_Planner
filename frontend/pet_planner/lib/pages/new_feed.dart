import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_planner/pages/schedule_page.dart';
import 'dart:async';
import 'package:pet_planner/pages/feeding_class.dart';

class NewFeedingPage extends StatefulWidget {
  NewFeedingPage({super.key});

  @override
  _NewFeedingPageState createState() {
    return _NewFeedingPageState();
  }
}

class _NewFeedingPageState extends State<NewFeedingPage> {
  Future<Feeding>? _futureFeeding;
  final _formKey = GlobalKey<FormState>();
  TextEditingController foodType = TextEditingController();
  TextEditingController foodBrand = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController measure = TextEditingController();
  TextEditingController timeOfDay = TextEditingController();
  TextEditingController medicine = TextEditingController();
  TextEditingController dose = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFFC6E2C3),
      appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
          leading: const CloseButton(
            color: Colors.black,
          ),
          title: const Text(
            "New Feeding",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () => Future(
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SchedulePage()),
                ),
              ),
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
      body: Form(
          key: _formKey,
          child: Column(children: [
            Row(
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: TextFormField(
                      controller: foodType,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      onFieldSubmitted: (_) => () {},
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Food Type",
                          hintText: 'Ex: kibble, canned...'),
                      validator: (foodType) =>
                          foodType != null && foodType.isEmpty
                              ? "Food type cannot be empty"
                              : null),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: TextFormField(
                      controller: foodBrand,
                      onFieldSubmitted: (_) => () {},
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Food Brand",
                          hintText: 'Enter the food brand'),
                      validator: (foodBrand) =>
                          foodBrand != null && foodBrand.isEmpty
                              ? "Food brand cannot be empty"
                              : null),
                )),
              ],
            ),
            Row(children: [
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: quantity,
                    onFieldSubmitted: (_) => () {},
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Quantity",
                        hintText: 'Enter the quantity'),
                    validator: (quanity) => quanity != null && quanity.isEmpty
                        ? "Quantity cannot be empty"
                        : null),
              )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: measure,
                    onFieldSubmitted: (_) => () {},
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Unit of Measure",
                        hintText: 'Ex: cups, lbs, ounces...'),
                    validator: (measure) => measure != null && measure.isEmpty
                        ? "Unit of measure cannot be empty"
                        : null),
              )),
            ]),
            Row(children: [
              Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                            controller: timeOfDay,
                            onFieldSubmitted: (_) => () {},
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Time of Day",
                                hintText: 'Ex: AM, PM, Noon...'),
                            validator: (timeOfDay) =>
                                timeOfDay != null && timeOfDay.isEmpty
                                    ? "Time of day cannot be empty"
                                    : null),
                      ))),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: medicine,
                          onFieldSubmitted: (_) => () {},
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Medicines/Suppliments (Optional)",
                              hintText: 'Enter any medications/suppliments'),
                        ))),
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: dose,
                          onFieldSubmitted: (_) => () {},
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Dose",
                              hintText: 'Enter the dose'),
                        ))),
              ),
            ])
          ])));

  FutureBuilder<Feeding> buildFutureBuilder() {
    return FutureBuilder<Feeding>(
        future: _futureFeeding,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.foodType);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        });
  }
}
