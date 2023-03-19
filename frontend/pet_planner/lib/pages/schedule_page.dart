import 'package:flutter/material.dart';
import 'package:pet_planner/pages/app_view.dart';
import 'package:pet_planner/pages/forgot_password.dart';
import 'package:pet_planner/pages/login_page.dart';
import 'package:pet_planner/pages/new_app.dart';
import 'package:pet_planner/pages/new_client.dart';
import 'package:pet_planner/pages/new_pet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:pet_planner/pages/event_provider.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

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
                    color: Color(0xFFAEB2C5),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: const Text("Logout"),
                        onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: const Text("Reset Password"),
                        onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ForgotPassword()),
                          ),
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.pets, color: Colors.black),
                    iconSize: 30,
                    offset: const Offset(0, 45),
                  ),
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
                "Your Schedule",
                style: TextStyle(fontFamily: 'robotoMedium', fontSize: 36),
              )),
          // add calendar - maybe syncfusion??
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    showCurrentTimeIndicator: true,
                    scheduleViewSettings: const ScheduleViewSettings(
                        monthHeaderSettings: MonthHeaderSettings(
                            backgroundColor: Color(0xFFAEB2C5),
                            monthTextStyle: TextStyle(
                                fontFamily: 'robotoReglar',
                                fontSize: 20,
                                color: Colors.black))),
                  ))),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            PopupMenuButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              color: Color(0xFFAEB2C5),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: const Text("Home"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SchedulePage()),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: const Text("New Client"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NewClientPage()),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("New Appointment"),
                  onTap: () => Future(
                    () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => NewAppointmentPage())),
                  ),
                ),
                PopupMenuItem(
                    value: 3,
                    child: Text("New Pet"),
                    onTap: () => Future(
                          () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => NewPetPage()),
                          ),
                        ))
              ],
              icon: const Icon(Icons.add_circle_outline, color: Colors.black),
              iconSize: 50,
              offset: const Offset(170, 50),
            )
          ]),
        ]));
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
