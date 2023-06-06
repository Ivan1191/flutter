import 'package:flutter/material.dart';
import 'main.dart';
import 'goto.dart';
import 'dest.dart';

// jsut initialization
List<FurtherKeyword> initList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: '',
      title: '',
    ),
    FurtherKeyword(
      assetName: '',
      title: '',
    ),
    FurtherKeyword(
      assetName: '',
      title: '',
    ),
  ];
}

class ThemeRoute extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<ThemeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 245, 225, 1), // 背景顏色
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '決定主題吧!',
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
                  MaterialPageRoute(builder: (context) {
                    theme = 1;
                    return GotoRoute(
                      furtherList: initList,
                      type: "玩樂",
                      level: '0',
                    );
                  }), // 替換為要跳轉的頁面
                );
              },
              child: Center(
                child: Image(image: AssetImage('images/1.1.png')),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    theme = 2;
                    return GotoRoute(
                      furtherList: initList,
                      type: "吃飯",
                      level: '0',
                    );
                  }),
                );
              },
              child: Center(
                child: Image.asset('images/1.2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
