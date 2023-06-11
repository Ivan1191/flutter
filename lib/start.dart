import 'package:fianl/theme.dart';
import 'package:flutter/material.dart';
import 'adultstart.dart';

class StartRoute extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _StartRouteState createState() => _StartRouteState();
}

class _StartRouteState extends State<StartRoute> {
  // 在這裡可以定義您的狀態和方法

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 245, 225, 1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 103),
            Image.asset(
              'images/logo2.png',
              width: 217,
              height: 217,
            ),
            SizedBox(height: 14),
            Text(
              '孩行',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 254, 130, 8),
              ),
            ),
            SizedBox(height: 30),
            Text(
              '家庭旅遊規劃',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 254, 130, 8)),
            ),
            Text(
              '與孩子同行',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 254, 130, 8)),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdultStart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 254, 130, 8),
                minimumSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 4,
              ),
              child: Text(
                '我是大人',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeRoute()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 254, 130, 8),
                minimumSize: Size(120, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadowColor: Colors.black,
                elevation: 10,
              ), //回傳到小孩選擇第一頁
              child: Text(
                '我是小孩',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
