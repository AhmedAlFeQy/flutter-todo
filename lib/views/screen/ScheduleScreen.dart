import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo/views/screen/BoardScreen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (BuildContext context) {
                  return const BoardScreen();
                },
              ));
            }),
        title: const Text(
          'Schedule',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.black,
          width: 1.0,
        )),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              dateTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
