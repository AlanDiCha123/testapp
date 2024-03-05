import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  final db = FirebaseFirestore.instance;
  late List<Meeting> meetings = [];

  Future<void> loadData() async {
    await db.collection('calendar').get().then((value) {
      List<Meeting> m = [];
      for (var doc in value.docs){
        final data = doc.data();
        final name = data['Name'];
        final startDate = (data['Starts'] as Timestamp).toDate();
        final endDate = (data['Ends'] as Timestamp).toDate();
        final color = Color(data['Color']);
        m.add(
          Meeting(name, startDate, endDate, color, false)
        );
      }
      setState(() {
        meetings = m;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(showAgenda: true),
          dataSource: MeetingDataSource(meetings),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ Navigator.pushNamed(context, '/addEvent'); },
        heroTag: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}