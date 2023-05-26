import 'package:flutter/material.dart';
import 'play.dart';

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

//not use
class TravelFoodItem extends StatelessWidget {
  const TravelFoodItem({super.key, required this.food, this.shape});

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 360.0;
  final TravelFood food;
  final ShapeBorder? shape;

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
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: Semantics(
                  label: food.title,
                  child: TravelFoodContent(food: food),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//use
class TappableTravelFoodItem extends StatefulWidget {
  final List<String> destList;

  const TappableTravelFoodItem({
    super.key,
    required this.food,
    required this.destList,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 270.0;
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        print(widget.food.title.toString());
                        foodList.add(widget.food.title.toString());
                        return PlayRoute(
                            destList: widget.destList, foodList: foodList);
                      }),
                    ).then((value) {
                      // navigator.pop's response
                      if (value != null) {
                        setState(() {
                          // TappableTravelDestinationItem
                          //     .MailArray[1].isFavorite = value;
                        });
                      }
                    });
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    label: widget.food.title,
                    child: TravelFoodContent(food: widget.food),
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

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class TravelFoodContent extends StatelessWidget {
  const TravelFoodContent({super.key, required this.food});

  final TravelFood food;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineSmall!.copyWith(
      color: Colors.white,
    );
    final descriptionStyle = theme.textTheme.titleMedium!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(food.assetName),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 29,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Semantics(
                    container: true,
                    header: true,
                    child: Text(
                      food.title,
                      style: titleStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DefaultTextStyle(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: descriptionStyle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This array contains the three line description on each card
                  // demo.
                  Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.volume_up_rounded),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    child: Text(
                      food.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (food.cardType == CardType.standard)
          // share, explore buttons
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('123'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('1223'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class FoodRoute extends StatefulWidget {
  final List<String> destList;
  FoodRoute({
    super.key,
    required this.destList,
  });

  @override
  State<FoodRoute> createState() => _FoodRouteState();
}

class _FoodRouteState extends State<FoodRoute> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => 'cards_demo';

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
    int selectedIndex = 0;
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 70) / 2;
    final double itemWidth = size.width / 2;

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
          // IconButton(
          //   icon: const Icon(
          //     Icons.search,
          //   ),
          //   color: Color.fromRGBO(0, 0, 0, 0.749),
          //   onPressed: () {
          //     showSearch(context: context, delegate: CustomSearchDelegate());
          //   },
          // ),
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          mainAxisSpacing: 0,
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            for (final food in food(context))
              SizedBox(
                  width: 100,
                  height: 100,
                  child: (food.cardType == CardType.standard)
                      ? TravelFoodItem(food: food)
                      : TappableTravelFoodItem(
                          food: food, destList: widget.destList)),
          ]),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group),
          //   label: 'Group',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.videocam),
          //   label: 'Meet',
          // ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              widget.destList.removeLast();
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
        onPressed: (() => {}),
        shape: CircleBorder(),
        isExtended: false,
        child: const Icon(Icons.replay_circle_filled),
      ),
    );
  }
}
