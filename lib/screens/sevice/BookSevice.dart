import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:nail_app/models/NailSalon.dart';
import 'package:nail_app/screens/order/OrderScreen.dart';
import 'dart:developer';

class BookSevice extends StatefulWidget {
  final Salon salon;
  final Sevice sevice;
  String phone;

  BookSevice({this.sevice, this.salon, this.phone});
  @override
  _BookSeviceState createState() => _BookSeviceState();
}

class _BookSeviceState extends State<BookSevice>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final textcontroller = TextEditingController();
  String name = "";
  String thoigian = "";
  List<Item> item = [
    Item(
      "https://kenh14cdn.com/thumb_w/620/2018/10/1/hai1344-153840589763529160131.jpg",
      "Tran Le Quoc",
    ),
    Item(
      "https://image.thanhnien.vn/768/uploaded/thuyptt/2018_11_29/rz2_vjaf.jpg",
      "Le Binh Phat",
    ),
    Item(
      "https://nld.mediacdn.vn/2019/11/1/tri5176-15725766498891910612748.jpg",
      "Ngo Kien Huy",
    ),
    Item(
      "https://media.doisongvietnam.vn/u/rootimage/editor/2017/07/10/22/42/w825/51499679774_5269.jpg",
      "BB Tran",
    ),
    Item(
      "https://afamilycdn.com/2019/11/26/1557383477-158-155736502822684-thumbnail-1574785338428595038078.jpg",
      "Ninh Dương Lan Ngọc",
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

  bool choose = false;
  var now = new DateTime.now();
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: new Text("Xin vui lòng đặt thời gian khác"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: new Text("Xin vui lòng nhập họ tên"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // checkTextFieldEmptyOrNot() {
  //   String text1;
  //   text1 = textcontroller.text;
  //   if (text1 == '') {
  //     _showDialog1();
  //   } else {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => OrderScreen(
  //                   ten: textcontroller.text,
  //                   thoigian: DateFormat("dd-MM-yyyy").format(now),
  //                 )));
  //   }
  // }
  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

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
                              setState(() {
                                index % 2 == 0 ? _showDialog() : choose = true;
                                thoigian = hour[index];
                              });
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
                                        child: choose
                                            ? Icon(
                                                Icons.check,
                                                color: Colors.green,
                                                size: 8,
                                              )
                                            : Container(),
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
                              name = item[index].name;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: item[index].selected
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
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
                    controller: textcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                        hintText: 'Moi chi nhap ho ten',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        prefixText: ' ',
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
                setState(() {
                  textcontroller.text.isEmpty
                      ? _showDialog1()
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen(
                                    ten: textcontroller.text,
                                    thoigian:
                                        DateFormat("dd-MM-yyyy").format(now),
                                    salon: widget.salon,
                                    sevice: widget.sevice,
                                  )));
                });
                //checkTextFieldEmptyOrNot();
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
