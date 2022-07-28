import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/views/Widget/InputField.dart';
import 'package:todo/views/screen/BoardScreen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  
  
  DateTime _dateTime = DateTime.now();
  int colorIndex = 0;
  int remind = 5;
  String repeat = "None";
  List<int> remindList = [5, 10, 15, 20];
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  String _endTime = "10:00 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
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
          'Add Task',
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InputField(
                    title: "Title",
                    hint: "Enter your title",
                  ),
                  InputField(
                    title: "Date",
                    hint: DateFormat.yMd().format(_dateTime),
                    widget: IconButton(
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _getDate();
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InputField(
                        hint: _startTime,
                        title: 'Start Date',
                        widget: IconButton(
                          onPressed: () {
                            _getTime(isStartTime: true);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: InputField(
                        hint: _endTime,
                        title: 'End Date',
                        widget: IconButton(
                          onPressed: () {
                            _getTime(isStartTime: false);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                    ],
                  ),
                  InputField(
                    title: "Remind",
                    hint: "$remind minutes early",
                    widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          remind = int.parse(newValue!);
                        });
                      },
                      items:
                          remindList.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()));
                      }).toList(),
                    ),
                  ),
                  InputField(
                    title: "Repeat",
                    hint: "$repeat",
                    widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          repeat = newValue!;
                        });
                      },
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.grey),
                            ));
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Wrap(
                            children: List<Widget>.generate(3, (int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    colorIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: index == 0
                                        ? Colors.blue
                                        : index == 1
                                            ? Colors.red
                                            : Colors.yellow,
                                    child: colorIndex == index
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                        : Container(),
                                  ),
                                ),
                              );
                            }),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.teal,
              ),
              child: TextButton(
                  child: const Text(
                    'Create Task',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return const AddTaskScreen();
                    }));
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _getDate() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    );
    if (_pickerDate != null) {
      setState(() {
        _dateTime = _pickerDate;
      });
    } else {
      print("there is something wrong ");
    }
  }

  _getTime({required bool isStartTime}) async {
    var pickedTime = await _showTime();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time Canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == true) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTime() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split("")[0])));
  }
}
