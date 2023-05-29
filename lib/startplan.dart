import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // 引入flutter_tts庫
import 'package:intl/intl.dart'; // 引入日期格式化套件
import 'kidaccount.dart';
import 'location.dart';
import './main.dart';
import 'package:intl/intl.dart';

class StartPlan extends StatefulWidget {
  @override
  _StartPlanState createState() => _StartPlanState();
}

class _StartPlanState extends State<StartPlan> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _DatetextEditingController = TextEditingController();
  TextEditingController _returnDateEditingController = TextEditingController();
  DateTime? selectedDate;
  DateTime? returnDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _DatetextEditingController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  Future<void> _selectReturnDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != returnDate) {
      setState(() {
        returnDate = picked;
        _returnDateEditingController.text =
            DateFormat('yyyy-MM-dd').format(returnDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var b = 8;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 180),
          Text(
            '創建行程',
            style: TextStyle(
              color: Color.fromARGB(255, 254, 130, 8),
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Text(
            '讓小孩能隨心所欲安排行程',
            style: TextStyle(
              color: Color.fromARGB(255, 254, 130, 8),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: '請為行程命名',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 248, 225),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: _selectDate,
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 248, 225),
                  minimumSize: Size(345, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.date_range_sharp,
                      color: Color.fromARGB(255, 147, 143, 153),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _DatetextEditingController,
                        decoration: InputDecoration(
                          labelText:
                              '出遊日期: ${selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now()) : ''}',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 248, 225),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              onPressed: _selectReturnDate,
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 248, 225),
                  minimumSize: Size(345, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.date_range_sharp,
                      color: Color.fromARGB(255, 147, 143, 153),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _returnDateEditingController,
                        decoration: InputDecoration(
                          labelText:
                              '回程日期: ${selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now()) : ''}',
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 248, 225),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 210),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 248, 225),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationPage()),
                    );
                  },
                  icon: Icon(Icons.arrow_right_alt_rounded,
                      color: Color.fromARGB(255, 254, 130, 8)),
                  iconSize: 30.0,
                  splashRadius: 20.0,
                  padding: EdgeInsets.all(10.0),
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
