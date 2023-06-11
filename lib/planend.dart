import 'package:flutter/material.dart';
// 引入flutter_tts庫
// 引入日期格式化套件
// ignore: depend_on_referenced_packages

class PlanEnd extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PlanEndState createState() => _PlanEndState();
}

class _PlanEndState extends State<PlanEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 248, 225),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 198),
            Image.asset(
              'images/4.1.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 25),
            Text(
              '行程規劃完成囉！',
              style: TextStyle(
                  color: Color.fromARGB(255, 254, 130, 8),
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 25),
            Text(
              '接下來請父母完成最後步驟！',
              style: TextStyle(
                  color: Color.fromARGB(255, 254, 130, 8),
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 75),
            Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 254, 130, 8),
                    minimumSize: Size(80, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))), //引導至規劃行程頁
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 248, 225),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
