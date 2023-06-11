import 'package:flutter/material.dart';
// 引入flutter_tts庫
// 引入日期格式化套件
import 'startplan.dart';

class KidAccount extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _KidAccountState createState() => _KidAccountState();
}

class _KidAccountState extends State<KidAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  '你的小孩',
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 130, 8),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  'images/kidinfo.png',
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 255, 248, 225),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartPlan()),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 254, 130, 8),
                ),
                iconSize: 30.0,
                splashRadius: 20.0,
                padding: EdgeInsets.all(10.0),
                constraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
              ),
            ),
            SizedBox(height: 250),
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
                        MaterialPageRoute(builder: (context) => StartPlan()),
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
        ),
      ),
    );
  }
}
