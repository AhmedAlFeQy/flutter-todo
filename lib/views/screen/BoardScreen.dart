import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/views/screen/ScheduleScreen.dart';
import 'package:todo/views/screen/addTaskScreen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Board',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                    return const ScheduleScreen();
                  }));
                },
              )
            ],
            shape: const Border(
                bottom: BorderSide(
              color: Colors.black,
              width: 1.0,
            )),
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                    child: Text(
                  'All',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text(
                  'Completed',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                  child: Text(
                    'Uncompleted',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favorite',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("All"),
                      ),
                      Center(
                        child: Text("Completed"),
                      ),
                      Center(
                        child: Text("UnCompleted"),
                      ),
                      Center(
                        child: Text("Favorite"),
                      ),
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
                        'Add Task',
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
        ),
      ),
    );
  }
}
