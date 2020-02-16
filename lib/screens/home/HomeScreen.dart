import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:nail_app/api/GetAllSalon.dart';
import 'package:nail_app/models/NailSalon.dart';
import 'package:nail_app/screens/home/DrawerScreen.dart';
import 'package:nail_app/screens/sevice/SeviceScreen.dart';
import 'package:nail_app/screens/signin/SignIn.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Item> items = [
    Item("assets/images/banner1.jpg", "My Nail Salon 1 ",
        "Số 1, Kim Mã, Ba Đình, Hà Nội"),
    Item("assets/images/banner2.jpg", "My Nail Salon 2 ",
        "Số 1, Kim Mã, Ba Đình, Hà Nội"),
    Item("assets/images/banner3.jpg", "My Nail Salon 3 ",
        "Số 1, Kim Mã, Ba Đình, Hà Nội"),
    Item("assets/images/banner4.jpg", "My Nail Salon 4 ",
        "Số 1, Kim Mã, Ba Đình, Hà Nội"),
    Item("assets/images/banner5.jpg", "My Nail Salon 5 ",
        "Số 1, Kim Mã, Ba Đình, Hà Nội"),
  ];
  Future _showDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn())),
            child: Text('Yes'),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  List<Salon> listData = List();
  @override
  void initState() {
    super.initState();
    loadAllSalon();
  }

  loadAllSalon() async {
    final data = await GetAllSalon.getListSalon();
    print(data);
    if (data == null) {
      return;
    }
    if (this.mounted) {
      this.setState(() {
        listData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerScreen(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Container(
              height: 30,
              width: 30,
              child: Image.asset(
                "assets/images/menu.png",
              ),
            ),
          ),
          backgroundColor: Colors.pink,
          title: Text("My Nail Salon",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset(
                      "assets/images/banner1.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.asset("assets/images/banner2.jpg", fit: BoxFit.fill),
                    Image.asset("assets/images/banner3.jpg", fit: BoxFit.fill),
                    Image.asset("assets/images/banner4.jpg", fit: BoxFit.fill),
                    Image.asset("assets/images/banner5.jpg", fit: BoxFit.fill),
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.pinkAccent,
                  indicatorBgPadding: 6.0,
                  borderRadius: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My Nail Salon",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  //itemCount: items.length,
                  itemCount: listData.length,
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  itemBuilder: (BuildContext context, int index) => Container(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Image.network(
                            //items[index].img, fit: BoxFit.fill,
                            '${listData[index].image}', fit: BoxFit.fill,
                          ),
                          Text(
                            //items[index].name,
                            '${listData[index].name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          Text(
                            //items[index].address,
                            '${listData[index].address}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeviceScreen(
                                      // ima: items[index].img,
                                      // name: items[index].name,
                                      salon: listData[index],
                                    )));
                        //builder: (context) => RestaurantMenu()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {},
          backgroundColor: Colors.pinkAccent,
        ),
      ),
    );
  }
}

class Item {
  String img;
  String name;
  String address;
  Item(this.img, this.name, this.address);
}
