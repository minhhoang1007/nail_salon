import 'package:flutter/material.dart';
import 'package:nail_app/screens/sevice/SeviceDetailScreen.dart';

class SeviceScreen extends StatefulWidget {
  String ima;
  String name;
  SeviceScreen({Key key, this.ima, this.name}) : super(key: key);

  @override
  _SeviceScreenState createState() => _SeviceScreenState();
}

class _SeviceScreenState extends State<SeviceScreen> {
  List<Item> item = [
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Nail Son Gel"),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Nail Son Gel"),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Nail Son Gel"),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Nail Son Gel"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(widget.name, style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Image.asset(
                  widget.ima,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: item.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      child: GridTile(
                        footer: Text(item[index].name),
                        child: Image.network(
                          item[index].img,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeviceDetailScreen(
                              name: item[index].name,
                            ),
                          ));
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String img;
  String name;
  Item(this.img, this.name);
}
