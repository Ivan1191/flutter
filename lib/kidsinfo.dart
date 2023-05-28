import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // 引入flutter_tts庫
import 'package:intl/intl.dart'; // 引入日期格式化套件
import 'kidaccount.dart';
import './main.dart';

class KidsInfo extends StatefulWidget {
  @override
  _KidsInfoState createState() => _KidsInfoState();
}

class _KidsInfoState extends State<KidsInfo> {
  TextEditingController _textEditingController = TextEditingController();

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: '請輸入小孩暱稱',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 248, 225),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: '請輸入小孩年齡',
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 248, 225),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(),
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
                        MaterialPageRoute(builder: (context) => KidAccount()),
                      );
                    },
                    icon: Icon(Icons.check,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var b = 8;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 190),
          Text(
            '創建小孩帳戶',
            style: TextStyle(
              color: Color.fromARGB(255, 254, 130, 8),
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 75),
          Image.asset(
            'images/kidinfo.png',
            width: 120,
            height: 120,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              showConfirmationDialog(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 248, 225),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)), // 设置背景颜色为红色
            ),
            child: Icon(
              Icons.edit,
              color: Color.fromARGB(255, 254, 130, 8),
            ),
          ),
        ],
      )),
    );
  }
}
