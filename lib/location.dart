import 'package:flutter/material.dart';
import 'place.dart';
import './main.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  bool _isFromHome = false; // 是否從家中出發
  bool _isOtherFrom = false; // 是否從其他出發地出發
  int _selectedIndex = 0;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 190),
            Text(
              '你現在的所在位置？',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 36),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // 將child移到最後一個參數
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isFromHome = true; // 設定為從家中出發
                        _isOtherFrom = false; // 設定為非從其他出發地出發
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _isFromHome
                          ? Colors.black
                          : Color.fromARGB(255, 255, 248, 225),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      '從家中出發',
                      style: TextStyle(
                        fontSize: 20,
                        color: _isFromHome
                            ? Colors.white
                            : Color.fromARGB(255, 254, 130, 8),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isFromHome = false; // 設定為非從家中出發
                        _isOtherFrom = true; // 設定為從其他出發地出發
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _isOtherFrom
                          ? Colors.black
                          : Color.fromARGB(255, 255, 248, 225),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      '其他出發地',
                      style: TextStyle(
                        fontSize: 20,
                        color: _isOtherFrom
                            ? Colors.white
                            : Color.fromARGB(255, 254, 130, 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isOtherFrom // 如果 _isOtherFrom 為 true，則顯示 TextFormField，否則顯示一個空的 Container
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20), // 設置上下左右的 padding 值
                    child: TextFormField(
                      //一個 Material Design 風格的文字輸入欄位 widget
                      controller: _textEditingController, //用於監聽文字輸入的變化
                      decoration: InputDecoration(
                        //用於設置文字輸入欄位的外觀
                        hintText: '請輸入出發地址', //設置文字輸入提示
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 248, 225),
                      ),
                      onChanged: (value) {
                        address = value; //將輸入的地址存儲在全域變數中
                      },
                    ),
                  )
                : Container(),
            SizedBox(height: 430),
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
                        MaterialPageRoute(builder: (context) => PlacePage()),
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
