import 'package:flutter/material.dart';
import 'package:nail_app/screens/home/NearBySalon.dart';
import 'package:nail_app/screens/home/UpdateScreen.dart';
import 'package:nail_app/screens/signin/SignIn.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Future _showDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn())),
            child: Text('Yes', style: TextStyle(color: Colors.pinkAccent)),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'No',
              style: TextStyle(color: Colors.pinkAccent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      height: 80.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Pham Minh Hoang",
                      style: TextStyle(color: Colors.white)),
                  Text(
                    "+12346789",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(
                    color: Colors.black12,
                    indent: 16.0,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Địa điểm các Salon"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NearBySalon()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Yêu thích"),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.watch_later),
            title: Text("Order History"),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ViewOrderScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text("Cập nhật thông tin"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Đăng xuất"),
            onTap: () {
              _showDialog(context, 'Bạn có muốn thoát?');
            },
          ),
        ],
      ),
    );
  }
}
