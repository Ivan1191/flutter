import 'package:flutter/material.dart';
import 'budget.dart';

class PlacePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  List<bool> isSelectedList = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 190),
            Text(
              '你想要旅遊的地區?',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 80),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                SquareButton(
                  index: 0,
                  isSelected: isSelectedList[0],
                  onPressed: () {
                    setState(() {
                      isSelectedList[0] = !isSelectedList[0];
                    });
                  },
                ),
                SquareButton(
                  index: 1,
                  isSelected: isSelectedList[1],
                  onPressed: () {
                    setState(() {
                      isSelectedList[1] = !isSelectedList[1];
                    });
                  },
                ),
                SquareButton(
                  index: 2,
                  isSelected: isSelectedList[2],
                  onPressed: () {
                    setState(() {
                      isSelectedList[2] = !isSelectedList[2];
                    });
                  },
                ),
                SquareButton(
                  index: 3,
                  isSelected: isSelectedList[3],
                  onPressed: () {
                    setState(() {
                      isSelectedList[3] = !isSelectedList[3];
                    });
                  },
                ),
                SquareButton(
                  index: 4,
                  isSelected: isSelectedList[4],
                  onPressed: () {
                    setState(() {
                      isSelectedList[4] = !isSelectedList[4];
                    });
                  },
                ),
                SquareButton(
                  index: 5,
                  isSelected: isSelectedList[5],
                  onPressed: () {
                    setState(() {
                      isSelectedList[5] = !isSelectedList[5];
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 100),
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
                        MaterialPageRoute(builder: (context) => BudgetPage()),
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

class SquareButton extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;

  const SquareButton({
    required this.index,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = '';
    switch (index) {
      case 0:
        buttonText = '大台北地區';
        break;
      case 1:
        buttonText = '桃竹苗';
        break;
      case 2:
        buttonText = '中彰投';
        break;
      case 3:
        buttonText = '雲嘉南';
        break;
      case 4:
        buttonText = '高屏地區';
        break;
      case 5:
        buttonText = '宜花東';
        break;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 160,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 254, 130, 8)
              : Color.fromARGB(255, 255, 248, 225),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: isSelected
                  ? Color.fromARGB(255, 255, 248, 225)
                  : Color.fromARGB(255, 254, 130, 8),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
