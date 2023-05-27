import 'package:flutter/material.dart';
import 'main.dart';
import 'voice.dart';
import 'package:fianl/dest.dart';
import 'package:fianl/food.dart';

class GotoRoute extends StatefulWidget {
  List<FurtherKeyword> Function(BuildContext) furtherList;
  GotoRoute({
    super.key,
    required this.furtherList,
  });

  @override
  _GotoState createState() => _GotoState();
}

class _GotoState extends State<GotoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 245, 225, 1), // 背景顏色
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (destList.isNotEmpty)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        destList.last,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                          height: 1.13,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' 想看什麼?',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 36,
                          height: 1.13,
                          color: Color.fromRGBO(254, 130, 8, 1),
                        ),
                      ),
                    ],
                  )
                : Text(
                    '你想去哪裡?',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      height: 1.13,
                      color: Color.fromRGBO(254, 130, 8, 1),
                    ),
                  ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VoiceRoute(
                          furtherList: widget.furtherList)), // 替換為要跳轉的頁面
                );
              },
              child: Center(
                child: Image(image: AssetImage('images/2.1.png')),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (theme == 1)
                          ? DestRoute(furtherList: widget.furtherList)
                          : FoodRoute()), // 替換為要跳轉的頁面
                );
              },
              child: Center(
                child: Image.asset('images/2.2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
