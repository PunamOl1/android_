import 'package:api/http/httpuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:medical_app/constants.dart';
import 'package:api/constant.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  bool morning = false;
  bool afternoon = false;
  bool night = false;
  String time = "";

  var _medicineController = TextEditingController();
  var _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Feather.chevron_left,
            color: kTextPrimary,
            size: 30,
          ),
        ),
        title: Text(
          'Reminder',
          style: TextStyle(
            color: kTextPrimary,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Medicine name',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kSecondary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF073738),
                    blurRadius: 10,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _medicineController,
                style: TextStyle(
                  color: kTextPrimary,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter medicine name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'When to take?',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        morning = !morning;
                        time = "morning";
                      });
                    },
                    child: TimeCard(
                      icon: Feather.sunrise,
                      time: 'Morning',
                      isSelected: morning,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        afternoon = !afternoon;
                        time = "afternoon";
                      });
                    },
                    child: TimeCard(
                      icon: Feather.sun,
                      time: 'Afternoon',
                      isSelected: afternoon,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        night = !night;
                        time = "night";
                      });
                    },
                    child: TimeCard(
                      icon: Feather.moon,
                      time: 'Night',
                      isSelected: night,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Additional notes',
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kSecondary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF073738),
                    blurRadius: 10,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _notesController,
                style: TextStyle(
                  color: kTextPrimary,
                ),
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Additional notes...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlatButton(
                onPressed: () async {
                  print("time ${time}");
                  var res = await HttpConnectUser().setReminder(
                      _medicineController.text, time, _notesController.text);
                  print(res);
                },
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                color: kSecondary,
                splashColor: kPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Feather.bell,
                      color: kTextPrimary,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Set Reminder',
                      style: TextStyle(
                        color: kTextPrimary,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    Key? key,
    required this.icon,
    required this.time,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 105,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? kTextSecondary : kSecondary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF073738),
            blurRadius: 10,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? kTextPrimary : kTextSecondary,
            size: 40,
          ),
          SizedBox(height: 5),
          Text(
            time,
            style: TextStyle(
              color: isSelected ? kTextPrimary : kTextSecondary,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
