import 'package:flutter/material.dart';

class PlanRoute extends StatefulWidget {
  PlanRoute({Key? key}) : super(key: key);

  @override
  State<PlanRoute> createState() => _PlanRouteState();
}

class _PlanRouteState extends State<PlanRoute> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: ColorPuzzlePage(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
            // ListTile(
            //   iconColor: Color.fromRGBO(0, 0, 0, 0.749),
            //   leading: Icon(Icons.tag_faces_rounded),
            //   title: Text('修改帳戶'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   iconColor: Color.fromRGBO(0, 0, 0, 0.749),
            //   leading: Icon(Icons.tour),
            //   title: Text('我的旅程'),
            //   onTap: () {},
            // ),
            // ListTile(
            //   iconColor: Color.fromRGBO(0, 0, 0, 0.749),
            //   leading: Icon(Icons.room),
            //   title: Text('我的定位'),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fast_rewind),
            label: 'Back',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pop(context);
              break;
          }
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

const Color defaultBorder = Color(0xffffffff);

class ShowColor {
  Color color;
  Color borderColor = defaultBorder;

  ShowColor(this.color, this.borderColor);
}

class PuzzleData {
  final Color color;
  final Color borderColor;

  PuzzleData({
    this.color = Colors.white,
    this.borderColor = defaultBorder,
  });
}

//draggable_item
class DraggableColor<T extends PuzzleData> extends StatefulWidget {
  final PuzzleData _data;
  final double size;

  DraggableColor(this._data, this.size);

  @override
  State<DraggableColor> createState() => _DraggableColorState();
}

class _DraggableColorState<T extends PuzzleData> extends State<DraggableColor> {
  @override
  Widget build(BuildContext context) {
    //定義好移動時的方塊樣式
    ColorSquare showSquare = ColorSquare(
      color: widget._data.color,
      size: widget.size,
      borderColor: Colors.white,
    );
    ColorSquare feedbackSquare = ColorSquare(
      color: widget._data.color,
      size: widget.size,
      borderColor: Colors.white,
    );

    return Draggable(
      feedback: feedbackSquare,
      childWhenDragging: Opacity(
        opacity: 0,
        child: showSquare,
      ),
      data: widget._data,
      onDragCompleted: () {
        debugPrint('onDragCompleted(), 被放掉＋接受');
        setState(() {});
      },
      child: showSquare,
    );
  }
}

//draggle_taget_item

class TargetColor extends StatefulWidget {
  final PuzzleData acceptedData;
  final ShowColor showColor;
  final double size;

  TargetColor(this.acceptedData, this.showColor, this.size);

  @override
  State<TargetColor> createState() => _TargetColorState();
}

class _TargetColorState extends State<TargetColor> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<PuzzleData>(
      builder: (context, candidateData, rejectedData) {
        return ColorSquare(
          color: widget.showColor.color,
          size: widget.size,
          borderColor: widget.showColor.borderColor,
        );
      },
      onWillAccept: (fromData) {
        debugPrint('onWillAccept()');

        Color hintColor = Colors.green;
        setState(() {
          widget.showColor.borderColor = hintColor;
        });
        return true;
      },
      onAccept: (PuzzleData fromData) {
        debugPrint('onAccept()');
        setState(() {
          widget.showColor.borderColor = Colors.white;
          widget.showColor.color = fromData.color;
        });
      },
      onLeave: (fromData) {
        debugPrint('onLeave()');
        setState(() {
          widget.showColor.borderColor = defaultBorder;
        });
      },
    );
  }
}

class ColorSquare extends StatelessWidget {
  final Color color;
  final double size;
  final Color borderColor;

  const ColorSquare({
    Key? key,
    required this.color,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(size / size);
    const Color background = Colors.white;
    final Border border = Border.all(
      color: borderColor,
      width: 2,
    );
    return Container(
      decoration: BoxDecoration(borderRadius: radius, color: background),
      child: Container(
          width: 50,
          height: 35,
          decoration:
              BoxDecoration(borderRadius: radius, border: border, color: color),
          child: Text("")),
    );
  }
}

List<Color> getColorsFromSingleColor(Color color, int count) {
  int alphaStart = 40;
  int diff = (color.alpha - alphaStart) ~/ count;
  List<Color> resultList = [];
  for (int i = 0; i < count; i++) {
    resultList.add(color.withAlpha(alphaStart + diff * i));
  }
  return resultList;
}

//main
const double pagePadding = 15;
const double itemPadding = 4;

class ColorPuzzlePage extends StatefulWidget {
  ColorPuzzlePage();

  @override
  State<ColorPuzzlePage> createState() => _ColorPuzzlePageState();
}

class _ColorPuzzlePageState extends State<ColorPuzzlePage> {
  bool isGameDone = false;
  int nowLevel = 0;
  int columnCount = 3;

  List<PuzzleData> targetData = List<PuzzleData>.generate(
      15, (int index) => PuzzleData(),
      growable: true);

  List<PuzzleData> fromData = List<PuzzleData>.generate(
      21, (int index) => PuzzleData(color: Color.fromARGB(255, 255, 184, 97)),
      growable: true);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width < screenSize.height
        ? screenSize.width
        : screenSize.height;
    double size = 100;
    debugPrint('screen width = $width, size=$size');

    //Define item and method
    List<Widget> targetItems = targetData.map((data) {
      var defaultColor = ShowColor(data.color, defaultBorder);
      return TargetColor(data, defaultColor, size);
    }).toList();
    List<Widget> fromItems =
        fromData.map((data) => DraggableColor(data, size)).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            ColorGrid(columnCount, targetItems, '日期'),
            ColorGrid(columnCount, fromItems, '行程'),
          ],
        ),
      ),
    );
  }

  void initiatePuzzle(List<Color> colors) {
    targetData = colors.map((color) => PuzzleData()).toList();
    colors.shuffle();
    fromData = colors.map((color) => PuzzleData()).toList();
  }

  void resetPuzzle() {
    targetData = targetData.map((puzzleData) => PuzzleData()).toList();
    fromData = fromData.map((puzzleData) => PuzzleData()).toList();
  }
}

class ColorGrid extends StatelessWidget {
  final int columnCount;
  final List<Widget> list;
  final String title;

  ColorGrid(this.columnCount, this.list, this.title);

  @override
  Widget build(BuildContext context) {
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color.fromARGB(255, 250, 240, 242),
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 203, 203, 203),
            offset: Offset(0.0, 1.0), //陰影y軸偏移量
            blurRadius: 0, //陰影模糊程度
            spreadRadius: 0 //陰影擴散程度
            )
      ],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: decoration,
      child: Row(
        children: [
          (title == '日期')
              ? Column(
                  children: [
                    Text(
                      ' 上午',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    SizedBox(
                      height: 72,
                    ),
                    Text(
                      ' 下午',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    SizedBox(
                      height: 72,
                    ),
                    Text(
                      ' 晚上',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      ' 景點',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ' 美食',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ' 活動',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                  ],
                ),
          Column(
            children: <Widget>[
              (title == '日期')
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '行程規畫表',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ],
                    )
                  : Row(),
              Center(
                child: (title == '日期')
                    ? SizedBox(
                        height: 320,
                        width: 425,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              pagePadding, 5, pagePadding, pagePadding),
                          child: GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: 0.8,
                            crossAxisCount: 5,
                            crossAxisSpacing: itemPadding,
                            mainAxisSpacing: itemPadding,
                            children: list,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 150,
                        width: 425,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              pagePadding, 15, pagePadding, pagePadding),
                          child: GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: 1.4,
                            crossAxisCount: 7,
                            crossAxisSpacing: itemPadding,
                            mainAxisSpacing: itemPadding,
                            children: list,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
