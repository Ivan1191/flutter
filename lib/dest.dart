import 'package:flutter/material.dart';
import 'food.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}

List<TravelDestination> destinations(BuildContext context) {
  return [
    TravelDestination(
      assetName: 'images/pic1.jpg',
      title: '金砂里步道',
      description: '溫暖的花季',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic2.jpg',
      title: '井仔腳鹽田',
      description: '慢生活步調',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic3.jpg',
      title: '漁光島沙灘',
      description: '金黃色夕陽',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic4.jpg',
      title: '台江國家公園',
      description: "綠自然景觀",
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
  ];
}

//not use
class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem(
      {super.key, required this.destination, this.shape});

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 360.0;
  final TravelDestination destination;
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
                  label: destination.title,
                  child: TravelDestinationContent(destination: destination),
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
class TappableTravelDestinationItem extends StatefulWidget {
  const TappableTravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 270.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  State<TappableTravelDestinationItem> createState() =>
      _TappableTravelDestinationItemState();
}

class _TappableTravelDestinationItemState
    extends State<TappableTravelDestinationItem> {
  // record selected item
  final destList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelDestinationItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        print(widget.destination.title.toString());
                        destList.add(widget.destination.title.toString());
                        return FoodRoute(destList: destList);
                      }),
                    ).then((value) {
                      // navigator.pop's response
                      if (value != null) {
                        setState(() {
                          print(value);
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
                    label: widget.destination.title,
                    child: TravelDestinationContent(
                        destination: widget.destination),
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

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({super.key, required this.destination});

  final TravelDestination destination;

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
                  image: AssetImage(destination.assetName),
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
                      destination.title,
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
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_up_rounded,
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 0),
                    child: Text(
                      destination.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DestRoute extends StatefulWidget {
  const DestRoute({super.key});

  @override
  State<DestRoute> createState() => _DestRouteState();
}

class _DestRouteState extends State<DestRoute> with RestorationMixin {
  int selectedIndex = 0;
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
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        itemCount: destinations(context).length,
        separatorBuilder: (context, index) => SizedBox(height: 10), // 垂直空間間距
        itemBuilder: (context, index) {
          final destination = destinations(context)[index];
          return SizedBox(
            width: double.infinity,
            height: TappableTravelDestinationItem.height,
            child: TappableTravelDestinationItem(
              destination: destination,
            ),
          );
        },
      ),
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
