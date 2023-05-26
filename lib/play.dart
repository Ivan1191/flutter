import 'package:flutter/material.dart';
import 'plan.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelPlay {
  const TravelPlay({
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

List<TravelPlay> playsite(BuildContext context) {
  return [
    TravelPlay(
      assetName: 'images/pic9.jpg',
      title: '大魯閣滑輪場',
      description: '南紡夢時代',
      cardType: CardType.tappable,
    ),
    TravelPlay(
      assetName: 'images/pic10.jpg',
      title: '奇美博物館',
      description: '藝術收藏',
      cardType: CardType.tappable,
    ),
    TravelPlay(
      assetName: 'images/pic11.jpg',
      title: '十鼓文創園區',
      description: '百年糖廠',
      cardType: CardType.tappable,
    ),
    TravelPlay(
      assetName: 'images/pic12.jpg',
      title: '走馬瀨農場',
      description: "露營好地點",
      cardType: CardType.tappable,
    ),
  ];
}

//not use
class TravelPlayItem extends StatelessWidget {
  const TravelPlayItem({super.key, required this.play, this.shape});

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 360.0;
  final TravelPlay play;
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
                  label: play.title,
                  child: TravelPlayContent(play: play),
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
class TappableTravelPlayItem extends StatefulWidget {
  final List<String> destList;
  final List<String> foodList;

  const TappableTravelPlayItem({
    super.key,
    required this.play,
    required this.destList,
    required this.foodList,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 270.0;
  final TravelPlay play;
  final ShapeBorder? shape;

  @override
  State<TappableTravelPlayItem> createState() => _TappableTravelPlayItemState();
}

class _TappableTravelPlayItemState extends State<TappableTravelPlayItem> {
  //All lists merge to one set
  final favoriteSet = {};
  final playList = <String>[];

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
              height: TappableTravelPlayItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onTap: () {
                    print(widget.play.title.toString());
                    playList.add(widget.play.title.toString());
                    favoriteSet['destination'] = widget.destList;
                    favoriteSet['food'] = widget.foodList;
                    favoriteSet['play'] = playList;
                    print(favoriteSet);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return PlanRoute();
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
                    label: widget.play.title,
                    child: TravelPlayContent(play: widget.play),
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

class TravelPlayContent extends StatelessWidget {
  const TravelPlayContent({super.key, required this.play});

  final TravelPlay play;

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
                  image: AssetImage(play.assetName),
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
                      play.title,
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
                      play.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (play.cardType == CardType.standard)
          // share, explore buttons
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(''),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(''),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class PlayRoute extends StatefulWidget {
  final List<String> destList;
  final List<String> foodList;
  PlayRoute({
    super.key,
    required this.destList,
    required this.foodList,
  });

  @override
  State<PlayRoute> createState() => _PlayRouteState();
}

class _PlayRouteState extends State<PlayRoute> with RestorationMixin {
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
            for (final play in playsite(context))
              SizedBox(
                  width: 100,
                  height: 100,
                  child: (play.cardType == CardType.standard)
                      ? TravelPlayItem(play: play)
                      : TappableTravelPlayItem(
                          play: play,
                          foodList: widget.foodList,
                          destList: widget.destList)),
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
              widget.foodList.removeLast();
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
