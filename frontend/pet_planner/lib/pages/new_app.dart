import 'package:flutter/material.dart';
import 'package:pet_planner/pages/schedule_page.dart';
import 'package:pet_planner/pages/utils.dart';
import 'package:provider/provider.dart';
import 'package:pet_planner/pages/event_provider.dart';

// Create new appointments for calendar

class NewAppointmentPage extends StatefulWidget {
  final Event? event;

  const NewAppointmentPage({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  final desc = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    } else {
      final event = widget.event!;

      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
      desc.text = event.description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    desc.dispose();
    super.dispose();
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
            "Create New Appointment",
            style: TextStyle(color: Colors.black),
          ),
          actions: buildEditingActions()),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                SizedBox(height: 12),
                buildDateTimePicker(),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: TextFormField(
                      controller: desc,
                      maxLines: 12,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Additional Information (Optional)'),
                      onFieldSubmitted: (_) => saveForm(),
                    )),
              ],
            ),
          )));

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: saveForm,
          icon: const Icon(
            Icons.done,
            color: Colors.black,
          ),
          label: const Text(
            "SAVE",
            style: TextStyle(color: Colors.black),
          ),
        )
      ];

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2023, 1),
          lastDate: DateTime(2101));
      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));

      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildTitle() => Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: TextFormField(
        style: TextStyle(fontSize: 30),
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), hintText: 'Add Name'),
        onFieldSubmitted: (_) => saveForm(),
        controller: titleController,
        validator: (title) =>
            title != null && title.isEmpty ? "Name cannot be empty" : null,
      ));

  Widget buildDateTimePicker() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
      header: 'FROM',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropdownField(
              text: Utils.toDate(fromDate),
              onClicked: () => pickFromDateTime(pickDate: true),
            ),
          ),
          Expanded(
              child: buildDropdownField(
                  text: Utils.toTime(fromDate),
                  onClicked: () => pickFromDateTime(pickDate: false)))
        ],
      ));

  Widget buildTo() => buildHeader(
      header: 'TO',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropdownField(
              text: Utils.toDate(toDate),
              onClicked: () => pickToDateTime(pickDate: true),
            ),
          ),
          Expanded(
              child: buildDropdownField(
                  text: Utils.toTime(toDate),
                  onClicked: () => pickToDateTime(pickDate: false)))
        ],
      ));

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(
          text,
          style: TextStyle(fontFamily: 'robotoRegular', fontSize: 20),
        ),
        leading: Icon(Icons.pets_outlined),
        trailing: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              style: const TextStyle(
                  fontFamily: 'robotoBold', color: Colors.black, fontSize: 22)),
          child,
        ],
      );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
          title: titleController.text,
          description: desc.text,
          from: fromDate,
          to: toDate,
          backgroundColor: const Color(0xFFAEB2C5),
          isAllDay: false);

      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);

      if (isEditing) {
        provider.editEvent(event, widget.event!);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SchedulePage()));
      } else {
        provider.addEvent(event);
      }

      Navigator.of(context).pop();
    }
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;
    setState(() => toDate = date);
  }
}

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    required this.backgroundColor,
    this.isAllDay = false,
  });
}
