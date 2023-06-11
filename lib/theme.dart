import 'package:flutter/material.dart';
import 'package:fianl/main.dart';
import 'goto.dart';
import 'dest.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
  // ignore: library_private_types_in_public_api
  _ThemesState createState() => _ThemesState();
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0, left: 90),
                  child: Text(
                    '決定主題吧！',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      height: 1.13,
                      color: Color.fromRGBO(254, 130, 8, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      speakText('決定主題吧！');
                    },
                    icon: Icon(Icons.volume_up_rounded),
                    color: Color.fromARGB(255, 254, 130, 8),
                    iconSize: 30,
                  ),
                ),
              ],
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
