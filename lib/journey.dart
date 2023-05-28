import 'package:flutter/material.dart';

class JourneyRoute extends StatefulWidget {
  @override
  State<JourneyRoute> createState() => _JourneyState();
}

class _JourneyState extends State<JourneyRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 225, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 248, 225, 1),
        actions: [
          IconButton(
            onPressed: () {
              // 處理完成按鈕的點擊事件
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(254, 130, 8, 1),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                '完成',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            '我的行程:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 130, 8, 1),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                // 一組圖片+文字
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'images/pic1.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      '賞櫻',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(254, 130, 8, 1),
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // 一組圖片+文字
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'images/pic2.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      '鹽田',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(254, 130, 8, 1),
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Color.fromRGBO(254, 130, 8, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                        size: 48,
                        color: Color.fromRGBO(254, 130, 8, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
