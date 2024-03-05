import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final db = FirebaseFirestore.instance;

  late DateTime startdate;
  late DateTime enddate;

  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color){
    setState(() {
      pickerColor = color;
    });
  }

  final TextEditingController eventName = TextEditingController();
  final TextEditingController eventStarts = TextEditingController();
  final TextEditingController eventEnds = TextEditingController();

  Future<void> loadData() async {
    String name = eventName.text;
    DateTime starts = startdate;
    DateTime ends = enddate;
    int color = currentColor.value;

    Map<String, dynamic> data = {
      'Name': name,
      'Starts': starts,
      'Ends': ends,
      'Color': color
    };

    await db.collection('calendar').doc(name).set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar evento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  TextField(
                    controller: eventName,
                    onSubmitted: (value) {
                      loadData();
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name event:'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: eventStarts,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Start Date:'),
                    onTap: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onChanged: (dateTime) {
                            print('Date Time: $dateTime');
                          }, onConfirm: (dateTime) {
                            setState(() {
                              startdate = dateTime;
                              eventStarts.text = dateTime.toString();
                            });
                          }, currentTime: DateTime.now());
                    },
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: eventEnds,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Final Date:'),
                    onTap: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onChanged: (dateTime) {
                            print('Date Time: $dateTime');
                          }, onConfirm: (dateTime) {
                            setState(() {
                              enddate = dateTime;
                              eventEnds.text = dateTime.toString();
                            });
                          }, currentTime: DateTime.now());
                    },
                    readOnly: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Choose a color'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                          pickerColor: pickerColor,
                                          onColorChanged: changeColor),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              currentColor = pickerColor;
                                              Navigator.of(context).pop();
                                              print(currentColor.value);
                                            });
                                          },
                                          child: const Text('Done'))
                                    ],
                                  );
                                });
                          },
                          child: const Text('Choose a color')),
                      Container(
                        width: 50,
                        height: 50,
                        color: currentColor,
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        loadData();
                        Navigator.pop(context);
                      },
                      child: const Text('Add'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}