import 'package:fianl/theme.dart';
import 'package:flutter/material.dart';

class AdultEnd extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AdultEndState createState() => _AdultEndState();
}

class _AdultEndState extends State<AdultEnd> {
// 是否從家中出發
// 是否從其他出發地出發

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 190),
            Text(
              '初步設定已完成',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40),
            Text(
              '請接續交給小孩完成',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 80),
            Image.asset(
              'images/kidinfo.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeRoute()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 248, 225),
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 4,
              ), //回傳到小孩選擇第一頁

              child: Text(
                '小孩模式',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 254, 130, 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
