import 'package:flutter/material.dart';
import 'package:pet_planner/pages/new_app.dart';
import 'package:pet_planner/pages/schedule_page.dart';
import 'package:pet_planner/pages/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// Displays information about an event, user can edit and delete event

class AppViewingPage extends StatelessWidget {
  final Event event;

  const AppViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
            leading: const CloseButton(color: Colors.black),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.black,
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NewAppointmentPage(event: event),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SchedulePage()));
                  final provider =
                      Provider.of<EventProvider>(context, listen: false);
                  provider.deleteEvent(event);
                },
              ),
            ]),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            SizedBox(height: 32),
            Row(children: [
              const Icon(
                Icons.pets,
                color: Color(0xFFAEB2C5),
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(event.title,
                  style:
                      const TextStyle(fontSize: 30, fontFamily: 'robotoBold')),
            ]),
            Row(children: [buildDateTime(event)]),
            const SizedBox(height: 50),
            Row(children: [buildDescription(event)]),
          ],
        ),
      );
}

Widget buildDateTime(Event event) {
  String eventFromDate = DateFormat('MMMM dd, yyyy').format(event.from);
  String eventFromTime = DateFormat('K:mm:a').format(event.from);
  String eventToDate = DateFormat('MMMM dd, yyyy').format(event.to);
  String eventToTime = DateFormat('K:mm:a').format(event.to);
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
    child: Container(
      child: Column(children: [
        Column(children: [
          Row(children: [
            const Text("Start Time: ",
                style: TextStyle(
                    fontFamily: 'robotoMedium',
                    fontSize: 20,
                    backgroundColor: Color(0xFFAEB2C5))),
            Text("$eventFromDate at $eventFromTime",
                style: const TextStyle(fontSize: 18))
          ]),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(children: [
                    const Text("End Time: ",
                        style: TextStyle(
                            fontFamily: 'robotoMedium',
                            fontSize: 20,
                            backgroundColor: Color(0xFFAEB2C5))),
                    Text("$eventToDate at $eventToTime",
                        style: const TextStyle(fontSize: 18))
                  ])),
            ],
          ),
        ])
      ]),
    ),
  );
}

Widget buildDescription(Event event) {
  return Row(children: [
    Container(
      child: Column(children: <Widget>[
        Row(children: [
          const Text("Additional Information: ",
              style: TextStyle(
                  fontFamily: 'robotoMedium',
                  fontSize: 20,
                  backgroundColor: Color(0xFFAEB2C5))),
          Row(children: <Widget>[
            Text(
              event.description.toString(),
              maxLines: 5,
              style: const TextStyle(fontSize: 18),
            )
          ])
        ])
      ]),
    )
  ]);
}
