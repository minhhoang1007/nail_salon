import 'package:flutter/material.dart';
import 'package:nail_app/api/GetStepService.dart';
import 'package:nail_app/models/NailSalon.dart';
import 'package:nail_app/models/NailSalon.dart' as prefix0;
import 'package:nail_app/screens/sevice/BookSevice.dart';

class SeviceDetailScreen extends StatefulWidget {
  // String name;
  // SeviceDetailScreen({Key key, this.name}) : super(key: key);
  final Sevice service;
  SeviceDetailScreen({this.service});

  @override
  _SeviceDetailScreenState createState() => _SeviceDetailScreenState();
}

class _SeviceDetailScreenState extends State<SeviceDetailScreen> {
  List<Item> item = [
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 1: Sau khi cắt móng, dũa shape móng theo ý của khách."),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 2: Sau khi cắt móng, dũa shape móng theo ý của khách."),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 3: Sau khi cắt móng, dũa shape móng theo ý của khách."),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 4: Sau khi cắt móng, dũa shape móng theo ý của khách."),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 4: "),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 4: "),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 4: "),
    Item(
        "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
        "Bước 4: "),
  ];
  bool isLoad = false;

  List<prefix0.Step> listStep = List();
  @override
  void initState() {
    super.initState();
    loadStep();
  }

  loadStep() async {
    final data = await GetStepService.getStep(widget.service.id);

    if (data == null) {
      return;
    }
    if (this.mounted) {
      this.setState(() {
        listStep = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('${widget.service.name}',
            style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
              width: double.infinity,
              child: Center(
                  child: Text(
                "CÁC BƯỚC SƠN GEL TẠI ZEMA",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
                flex: 1,
                child: GridView.builder(
                  itemCount: listStep.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoad = !isLoad;
                        });
                      },
                      child: Container(
                        //color: isLoad ? Colors.pinkAccent : Colors.white,
                        child: Column(
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(
                                //item[index].img,
                                listStep[index].image,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Text(
                              //item[index].name,
                              listStep[index].step,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    width: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text('Gia: ',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Text('${widget.service.price}',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: InkWell(
                child: SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Text('Đặt Lịch Ngay',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookSevice()));
                },
              ),
            ),
          ],
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
