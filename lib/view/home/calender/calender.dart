import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:teamhup/componant/appbarsimple.dart';
import 'package:teamhup/componant/buttonapp.dart';
import 'package:teamhup/componant/colorsapp.dart';
import 'package:teamhup/componant/inputapp.dart';
import 'package:teamhup/componant/showModalBottomSheet.dart';
import 'package:teamhup/provider/prov.dart';
import 'package:teamhup/view/home/calender/detailsDay.dart';
import 'package:teamhup/view/home/calender/clock.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Calender();
  }
}

class _Calender extends State<Calender> {
  ShowModalBottomSheet showBottomSheet = new ShowModalBottomSheet();
  ColorsApp colorsApp = new ColorsApp();
  DateTime _focusedDay = DateTime.now();
  List timeday = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];
  List details = [
    '00:00',
    '07:00',
    '11:15',
    '19:15'
  ]; //,'03:00','04:00','06:00',
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: "Calender",
        backgroundColor: colorsApp.colorwhiteapp.withOpacity(0.0),
      ),
      backgroundColor: colorsApp.colorwhiteapp.withOpacity(0.95),
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 600,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: TableCalendar(
                            firstDay: DateTime.utc(2023, 1, 1),
                            lastDay: DateTime.utc(2025, 12, 31),
                            focusedDay: _focusedDay,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _focusedDay =
                                    focusedDay; // تحديث اليوم المحدد عند التغيير
                              });
                            },
                            calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              weekendTextStyle: TextStyle(color: Colors.red),
                              holidayTextStyle: TextStyle(color: Colors.red),
                            ),
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              leftChevronIcon:
                                  Icon(Icons.arrow_back_ios, size: 16),
                              rightChevronIcon:
                                  Icon(Icons.arrow_forward_ios, size: 16),
                              titleTextStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            calendarBuilders: CalendarBuilders(
                              dowBuilder: (context, day) {
                                final text = [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun'
                                ][day.weekday - 1];
                                return Center(
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: day.weekday == DateTime.saturday ||
                                              day.weekday == DateTime.sunday
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              '16',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Birthday of the Islamic Prophet Muhammad',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: colorsApp.colorgreyapp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 0),
                    height: 350,
                    child: ContainerClock(timeday: timeday, details: details))
              ],
            ),
          ),
        );
      }),
      floatingActionButton: Container(
          margin: EdgeInsets.only(left: 20),
          child: ButtonCalender(
              title: "Add event",
              color: colorsApp.colorblackapp,
              colorfont: colorsApp.colorwhiteapp,
              width: double.infinity,
              height: 50,
              icon: Icon(
                Icons.add_circle_outline,
                color: colorsApp.colorwhiteapp,
              ),
              func: () {})),
    );
  }
}
