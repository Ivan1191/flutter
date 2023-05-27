import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'main.dart';
import 'choice.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelFood {
  const TravelFood({
    required this.assetName,
    required this.title,
    required this.description,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String title;
  final String description;
  final CardType cardType;
}

List<TravelFood> food(BuildContext context) {
  return [
    TravelFood(
      assetName: 'images/pic5.jpg',
      title: '無名米糕',
      description: '肉鬆糯米飯',
      cardType: CardType.tappable,
    ),
    TravelFood(
      assetName: 'images/pic6.jpg',
      title: '民生路意麵',
      description: '滷味才是王道',
      cardType: CardType.tappable,
    ),
    TravelFood(
      assetName: 'images/pic7.jpg',
      title: '六千牛肉湯',
      description: '濃郁牛肉湯頭',
      cardType: CardType.tappable,
    ),
    TravelFood(
      assetName: 'images/pic8.jpg',
      title: '花園夜市',
      description: "四六日營業",
      cardType: CardType.tappable,
    ),
  ];
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

void showConfirmationDialog(BuildContext context, TravelFood food) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('是否完成選擇動作？'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     print(food.title.toString());
              //     foodList.add(food.title.toString());
              //     return PlanRoute(list: foodList);
              //   }),
              // );
            },
            child: Text(
              '完成',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 取消，返回原本的頁面
            },
            child: Text(
              '取消',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}

class TappableTravelFoodItem extends StatefulWidget {
  const TappableTravelFoodItem({
    super.key,
    required this.food,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 180.0;
  final TravelFood food;
  final ShapeBorder? shape;

  @override
  State<TappableTravelFoodItem> createState() => _TappableTravelFoodItemState();
}

class _TappableTravelFoodItemState extends State<TappableTravelFoodItem> {
  // record selected item
  final foodList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelFoodItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onTap: () {
                    showConfirmationDialog(context, widget.food);
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    label: widget.food.title,
                    child: Semantics(
                      //label: widget.destination.title,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Ink.image(
                                image: AssetImage(widget.food.assetName),
                                fit: BoxFit.cover,
                                child: Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
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

class FoodRoute extends StatefulWidget {
  FoodRoute({
    super.key,
  });

  @override
  State<FoodRoute> createState() => _FoodRouteState();
}

class _FoodRouteState extends State<FoodRoute> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => '';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 115,
          ),
          Text(
            '可以前往的!',
            style: TextStyle(
              fontFamily: 'Arial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 36,
              height: 1.13,
              color: Color.fromRGBO(254, 130, 8, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.count(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 0,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                for (final food in food(context))
                  Column(
                    children: [
                      SizedBox(child: TappableTravelFoodItem(food: food)),
                      Semantics(
                        container: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: DefaultTextStyle(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: IconButton(
                                    onPressed: () {
                                      speakText(food.description);
                                    },
                                    icon: Icon(Icons.volume_up_rounded),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 11, left: 2),
                                  child: Text(
                                    food.description,
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ]),
        ],
      ),
    );
  }
}
