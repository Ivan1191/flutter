import 'package:flutter/material.dart';
// 引入flutter_tts庫
// 引入日期格式化套件
import 'kidsinfo.dart';

class SignupPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // 在這裡可以定義您的狀態和方法

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 225),
          Text(
            '登入',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 254, 130, 8)),
          ),
          SizedBox(height: 92),
          Text(
            '保留您的每次行程',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 254, 130, 8)),
          ),
          SizedBox(height: 90),
          Padding(
            padding: EdgeInsets.only(left: 88, right: 88),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KidsInfo()),
                );
                // 按钮点击事件处理逻辑
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 248, 225),
                minimumSize: Size(215, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.facebook,
                      color: Color.fromARGB(255, 12, 72, 122),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '以Facebook繼續',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 88, right: 88),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KidsInfo()),
                );
                // 按钮点击事件处理逻辑
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 248, 225),
                minimumSize: Size(215, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.mail,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '以Google繼續',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ), //facebook登入
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 88, right: 88),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KidsInfo()),
                );
                // 按钮点击事件处理逻辑
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 248, 225),
                minimumSize: Size(215, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '以Apple繼續',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
  // 在這裡構建您的頁面UI
}
