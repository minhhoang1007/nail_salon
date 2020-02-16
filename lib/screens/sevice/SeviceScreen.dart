import 'package:flutter/material.dart';
import 'package:nail_app/api/GetAllService.dart';
import 'package:nail_app/models/NailSalon.dart';
import 'package:nail_app/screens/sevice/SeviceDetailScreen.dart';

class SeviceScreen extends StatefulWidget {
  // String ima;
  // String name;
  final Salon salon;
  SeviceScreen({this.salon});
  // SeviceScreen({Key key, this.ima, this.name}) : super(key: key);

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
  List<Sevice> listService = List();
  @override
  void initState() {
    super.initState();

    loadSevice();
  }

  loadSevice() async {
    final data = await GetAllService.getService(widget.salon.id);

    if (data == null) {
      return;
    }
    if (this.mounted) {
      this.setState(() {
        listService = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('${widget.salon.name}',
              style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Image.network(
                  '${widget.salon.image}',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text("MỜI CHỊ CHỌN DỊCH VỤ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: listService.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      child: GridTile(
                        footer: Text(
                          '${listService[index].name}',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Image.network(
                          '${listService[index].image}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeviceDetailScreen(
                              //name: item[index].name,
                              service: listService[index],
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
