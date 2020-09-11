import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_game_app/Data/data.dart';
import 'package:memory_game_app/Model/tile_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileModel> visiblePairs = new List<TileModel>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    pairs = getPairs();
    pairs.shuffle();

    visiblePairs = pairs;
    selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
        _startTimer();
      });
    });
  }

  void update(int index) {
    if (!selected) {
      clickCounter++;
      if (selectedIndex == null && pairs[index].getIsSelected() == false) {
        selectedIndex = index;
        setState(() {
          pairs[index].setIsSelected(true);
        });
      } else if (selectedIndex != null &&
          pairs[index].getIsSelected() == false) {
        setState(() {
          pairs[index].setIsSelected(true);
        });
        //check if ok

        if (pairs[index].getImageAssetPath() ==
            pairs[selectedIndex].getImageAssetPath()) {
          pairs[index].setOk(true);
          pairs[selectedIndex].setOk(true);
          points++;
        } else {
          int x = selectedIndex;
          Future.delayed(const Duration(seconds: 1), () {
            pairs[x].setIsSelected(false);
            pairs[index].setIsSelected(false);
            setState(() {});
          });
        }
        selectedIndex = null;
        if (chechComplete()) {
          _timer.cancel();
          showDialogComplete();
        }
      }
    }
  }

  Future showDialogComplete() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
                          child: Container(
                  height: 85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.done,
                            color: Colors.blue,
                          ),
                          Text(
                            'Completed In ',
                            style: TextStyle(fontSize: 25, color: Colors.green),
                            textAlign: TextAlign.center,
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("$counter Seconds"),
                      Text("$clickCounter Clicks")
                    ],
                  )),
            ),
            actions: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        reset();
                        Navigator.of(context).pop();
                      },
                      child: Text('Restart'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text('Exit Game'),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  bool chechComplete() {
    for (var item in pairs) {
      if (!item.getOk()) return false;
    }
    return true;
  }

  Timer _timer;
  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          reset();
        },
        child: Icon(Icons.refresh),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: <Widget>[
            Text(
              "$points/8",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text("Points"),
            SizedBox(
              height: 20,
            ),
            Text(
              "$counter",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            Text("Seconds"),
            SizedBox(
              height: 20,
            ),
            Text(
              "$clickCounter",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Text("Click"),
            SizedBox(
              height: 20,
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1,
              ),
              children: List.generate(visiblePairs.length, (index) {
                return Tile(
                  imageAssetsPath: visiblePairs[index].getImageAssetPath(),
                  isSelected: visiblePairs[index].getIsSelected(),
                  parent: this,
                  tileIndex: index,
                  onUpdate: () {
                    update(index);
                  },
                );
              }),
            ),
            // CircularProgressIndicator(
            //   value:0.5,
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //   backgroundColor: Colors.blue,
            // ),
          ],
        ),
      ),
    );
  }

  void reset() {
    _timer.cancel();
    points = 0;
    counter = 0;
    clickCounter = 0;
    pairs = getPairs();
    pairs.shuffle();
    setState(() {
      visiblePairs = pairs;
    });
    selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
        _startTimer();
      });
    });
  }
}

class Tile extends StatefulWidget {
  String imageAssetsPath;
  bool isSelected;
  int tileIndex;
  _HomePageState parent;
  VoidCallback onUpdate;
  Tile(
      {this.imageAssetsPath,
      this.isSelected,
      this.parent,
      this.tileIndex,
      this.onUpdate});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return InkWell(
              onTap: () {
                if (!pairs[widget.tileIndex].getIsSelected()) {
                  animationController.value = 0;
                  animationController.forward();
                }

                widget.onUpdate();
                //animationController.stop();
              },
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * animation.value),
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[600],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Image.asset(
                    getImagePath(widget.tileIndex),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }

  String getImagePath(int index) {
    if (pairs[index].getIsSelected())
      return pairs[index].getImageAssetPath();
    else
      return widget.imageAssetsPath;
  }
}
