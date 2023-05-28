import 'package:flutter/material.dart';
import 'adultend.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  String? _minBudget; // 加上問號，表示該變數可以為 null
  String? _maxBudget; // 加上問號，表示該變數可以為 null

  final List<String> _budgetRanges = [
    '1000元',
    '2000元',
    '3000元',
    '4000元',
    '5000元',
  ];

  @override
  Widget build(BuildContext context) {
    var b = 8;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 190),
            Text(
              '你的旅遊預算？',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200, // 设置一个有限高度
                    child: Row(
                      children: [
                        Expanded(
                          // 左側欄位(最低預算)
                          child: Column(
                            children: [
                              Text(
                                '最低預算', // 標籤文字
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 254, 130, 8),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 20), // 添加一個10像素高的間隔
                              DropdownButton<String>(
                                // 下拉式選單
                                isExpanded: true, // 設置下拉式選單為填滿父元件寬度
                                value: _minBudget, // 下拉式選單當前選取值
                                icon: const Icon(Icons.arrow_downward,
                                    color: Color.fromARGB(
                                        255, 254, 130, 8)), // 下拉箭頭圖示
                                iconSize: 24, // 下拉箭頭圖示大小
                                elevation: 16, // 下拉式選單陰影
                                style: const TextStyle(
                                    color: Colors.black), // 下拉選單選項文字的樣式
                                underline: Container(
                                  // 下拉選單的底線
                                  height: 2, // 底線高度
                                  color: Color.fromARGB(
                                      255, 255, 248, 225), // 底線顏色
                                ),
                                onChanged: (String? newValue) {
                                  // 當選取值改變時的回調函數
                                  setState(() {
                                    _minBudget = newValue; // 更新選取值
                                  });
                                },
                                items: _budgetRanges // 下拉選單選項
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value, // 選項值
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 254, 130, 8)),
                                    ), // 選項顯示的標籤文字
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50), // 添加一個20像素寬的間隔
                        Expanded(
                          // 右側欄位(最高預算)
                          child: Column(
                            children: [
                              Text(
                                '最高預算',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 254, 130, 8),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 20),
                              DropdownButton<String>(
                                isExpanded: true,
                                value: _maxBudget,
                                icon: const Icon(Icons.arrow_downward,
                                    color: Color.fromARGB(255, 254, 130, 8)),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Color.fromARGB(255, 255, 248, 225),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _maxBudget = newValue;
                                  });
                                },
                                items: _budgetRanges
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 254, 130, 8)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 285),
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
                        MaterialPageRoute(builder: (context) => AdultEnd()),
                      );
                    },
                    icon: Icon(Icons.check,
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
