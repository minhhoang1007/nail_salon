import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:nail_app/screens/order/OrderScreen.dart';
import 'dart:developer';

class BookSevice extends StatefulWidget {
  @override
  _BookSeviceState createState() => _BookSeviceState();
}

class _BookSeviceState extends State<BookSevice>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Item> item = [
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Tran Le Quoc",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Le Binh Phat",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://zema.com.vn/wp-content/uploads/bfi_thumb/son_gel_13-39j80fyhh0ebky3ohn12ww.jpg",
      "Ngo Kien Huy",
    ),
  ];
  List<String> hour = [
    "8h00",
    "9h00",
    "10h00",
    "11h00",
    "12h00",
    "13h00",
    "14h00",
    "15h00",
    "16h00",
    "17h00",
    "18h00",
    "19h00"
  ];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  var now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Đặt Lịch", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: height * 0.05,
            child: Center(
                child: Text(
              "CHỌN NGÀY/GIỜ LÀM NAIL",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            height: height * 0.8,
            child: Column(
              children: <Widget>[
                TabBar(
                  unselectedLabelColor: Colors.pink[100],
                  indicator: BoxDecoration(color: Colors.pinkAccent),
                  controller: controller,
                  tabs: <Widget>[
                    Tab(
                      text: "Hôm nay \n" + DateFormat("dd-MM-yyyy").format(now),
                    ),
                    Tab(
                      text: "Ngày mai \n " +
                          DateFormat("dd-MM-yyyy").format(
                              DateTime(now.year, now.month, now.day + 1)),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      GridView.builder(
                        itemCount: hour.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              height: height * 0.06,
                              child: Stack(
                                children: <Widget>[
                                  Card(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Center(
                                            child: Text(hour[index],
                                                style: TextStyle(fontSize: 24)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Container(
                                            child: Text(
                                              index % 2 == 0
                                                  ? "Hết chỗ"
                                                  : "Còn chỗ",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 10,
                                          width: double.infinity,
                                          color: index % 2 == 0
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ],
                                    ),
                                    elevation: 5,
                                  ),
                                  Positioned(
                                    left: 80,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(120),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      GridView.builder(
                        itemCount: hour.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Center(
                                    child: Text(hour[index],
                                        style: TextStyle(fontSize: 24)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    index % 2 == 0 ? "Hết chỗ" : "Còn chỗ",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                Divider(
                                  color: index % 2 == 0
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height * 0.03,
                  child: Text(
                    "CHỌN STYLIST",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    height: height * 0.25,
                    child: ListView.builder(
                      itemCount: item.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              item[index].selected = !item[index].selected;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: item[index].selected
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            //border: Border.all(color: Colors.grey)),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: ClipOval(
                                    child: Image.network(
                                      item[index].img,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    item[index].name,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Rate: ",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
          Container(
            height: height * 0.16,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CHI HAY NHAP TEN:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Moi chi nhap ho ten',
                        //helperText: 'Keep it short, this is just a demo.',
                        //labelText: 'Life story',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        prefixText: ' ',
                        //suffixText: 'USD',
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.1, right: width * 0.1, top: width * 0.05),
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
                    MaterialPageRoute(builder: (context) => OrderScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String img;
  String name;
  bool selected = false;
  Item(this.img, this.name);
}
