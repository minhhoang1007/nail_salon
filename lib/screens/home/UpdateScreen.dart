import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({Key key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text("Cập nhật thông tin",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.2,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text(
                    "Nhập họ tên: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: 'Moi chi nhap ho ten',
                          //helperText: 'Keep it short, this is just a demo.',
                          //labelText: 'Life story',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.pinkAccent,
                          ),
                          prefixText: ' ',
                          //suffixText: 'USD',
                          suffixStyle: const TextStyle(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.2,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text("Nhập địa chỉ: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          hintText: 'Moi chi nhap dia chi: ',
                          //helperText: 'Keep it short, this is just a demo.',
                          //labelText: 'Life story',
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: Colors.green,
                          ),
                          prefixText: ' ',
                          suffixStyle: const TextStyle(color: Colors.pink)),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                height: height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "CẬP NHẬT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
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
