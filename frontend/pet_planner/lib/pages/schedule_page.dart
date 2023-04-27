import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_planner/pages/app_view.dart';
import 'package:pet_planner/pages/exist_client.dart';
import 'package:pet_planner/pages/exist_pet.dart';
import 'package:pet_planner/pages/forgot_password.dart';
import 'package:pet_planner/pages/login_page.dart';
import 'package:pet_planner/pages/new_app.dart';
import 'package:pet_planner/pages/new_client.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:pet_planner/pages/event_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'client_class.dart';
import 'exist_feeding.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  List<Client> _clients = [];
  List<Client> _searchResults = [];
  bool _isVisible = false;

  Future<void> _fetchClients() async {
    final response = await http
        .get(Uri.parse('https://petplanner.azurewebsites.net/client'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _clients = data.map((client) => Client.fromJson(client)).toList();
        _searchResults = _clients;
      });
    } else {
      throw Exception('Failed to fetch clients');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchClients();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchResults = _clients.where((client) {
        final fullName =
            '${client.firstName.toLowerCase()} ${client.lastName.toLowerCase()}';
        return fullName.contains(text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Column(children: [
          SizedBox(
              height: 75,
              child: AppBar(
                backgroundColor: const Color(0xFFFFFFFF).withOpacity(.8),
                leading: PopupMenuButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  color: const Color(0xFFAEB2C5),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: const Text("Logout"),
                      onTap: () => Future(
                        () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: const Text("Reset Password"),
                      onTap: () => Future(
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ForgotPassword()),
                        ),
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.pets, color: Colors.black),
                  iconSize: 30,
                  offset: const Offset(0, 45),
                ),
                title: Padding(
                    padding: const EdgeInsets.fromLTRB(700, 0, 0, 0),
                    child: GestureDetector(
                      //onTap: () => buildResults(),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                            hintText: "Search",
                            prefixIcon: InkWell(
                                child:
                                    Icon(Icons.search, color: Colors.black))),
                        onChanged: _onSearchTextChanged,
                        onTap: buildResults,
                      ),
                    )),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("Your Schedule",
                    style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36)))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAEB2C5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return (OldClientPage());
                }));
              },
              child: const Text("Existing Clients",
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAEB2C5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return (OldFeedingPage());
                }));
              },
              child: const Text("Existing Feedings",
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(width: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAEB2C5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return (const OldPetPage());
                  }));
                },
                child: const Text("Existing Pets",
                    style: TextStyle(color: Colors.black)))
          ]),
          // syncfusion calendar
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                  height: 500,
                  child: SfCalendar(
                    view: CalendarView.schedule,
                    cellBorderColor: Colors.black,
                    dataSource: EventDataSource(events),
                    allowedViews: const [
                      CalendarView.schedule,
                      CalendarView.day,
                      CalendarView.month,
                      CalendarView.timelineDay,
                      CalendarView.timelineWorkWeek
                    ],
                    initialDisplayDate: DateTime.now(),
                    onTap: (details) {
                      if (details.appointments == null) return;
                      final event = details.appointments!.first;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppViewingPage(event: event),
                      ));
                    },
                    todayHighlightColor: const Color(0xFFAEB2C5),
                    todayTextStyle: const TextStyle(
                        color: Colors.black, fontFamily: 'robotoRegular'),
                    showCurrentTimeIndicator: true,
                    scheduleViewSettings: const ScheduleViewSettings(
                        // Calendar display settings
                        dayHeaderSettings: DayHeaderSettings(
                            dayTextStyle: TextStyle(color: Colors.black)),
                        weekHeaderSettings: WeekHeaderSettings(
                            weekTextStyle: TextStyle(color: Colors.black)),
                        monthHeaderSettings: MonthHeaderSettings(
                            backgroundColor: Color(0xFFAEB2C5),
                            monthTextStyle: TextStyle(
                                fontFamily: 'robotoReglar',
                                fontSize: 20,
                                color: Colors.black))),
                  ))),
          /* Column(children: [
            Expanded(
                child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final client = _searchResults[index];
                return SizedBox(
                    height: 100,
                    child: ListTile(
                      title: Text('${client.firstName} ${client.lastName}'),
                      subtitle: Text(client.email),
                    ));
              },
            ))
          ]), */
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color(0xFFAEB2C5),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: const Text("New Client"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NewClientPage()),
                    ),
                  ),
                ),
              ],
              icon: const Icon(Icons.add_circle_outline, color: Colors.black),
              iconSize: 50,
              offset: const Offset(170, 50),
            )
          ]),
        ]));
  }

  Column buildResults() {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (BuildContext context, int index) {
            final client = _searchResults[index];
            return ListTile(
              title: Text('${client.firstName} ${client.lastName}'),
            );
          },
        ),
      ),
    ]);
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;
}
