import 'package:flutter/material.dart';
import 'package:nail_app/screens/home/NearBySalon.dart';
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.jpg",
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover,
                  ),
                  Text("Pham Minh Hoang", style: TextStyle(color: Colors.red)),
                  Text(
                    "+12346789",
                    style: TextStyle(color: Colors.blue),
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
            leading: Icon(Icons.local_dining),
            title: Text("Nearby Salon"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NearBySalon()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorites"),
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
            title: Text("Update Information"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UpdateScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Sign Out"),
            onTap: () {
              // _showDialog(context, 'Do you want exit?');
            },
          ),
        ],
      ),
    );
  }
}
