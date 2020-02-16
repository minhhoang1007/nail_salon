import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.pinkAccent,
          child: Column(
            children: <Widget>[
              Container(
                height: height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                          child: Icon(Icons.home, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text("CẢM ƠN CHỊ ĐÃ ĐẶT LỊCH TẠI NAILSALON",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Thông tin đặt lịch",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.date_range),
                              Text("17h ngày 21/1/2019")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.person_pin),
                              Text("Nguyen van A")
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Số 1 Cầu Giấy",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.account_balance),
                              Text("nail.com")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.phone),
                              Text("0124454545")
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.timelapse),
                              Text("Mở cửa: 8h00 - 20h00"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.add_location),
                              Text("Quận Cầu Giấy, Hà Nội"),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("MỖI SỐ ĐIỆN THOẠI CHỈ DÀNH CHO 1 NGƯỜI"),
                          Text(
                              "(*) Nếu cần đặt cho nhiêu người, chị có thể dùng SĐT khác để đặt thêm 1 lần nữa hoặc gọi tới hotline để được sắp xếp")
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("YÊU CẦU ĐẶC BIỆT KHÁC"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Nhap vao day',
                                  //helperText: 'Keep it short, this is just a demo.',
                                  //labelText: 'Life story',

                                  prefixText: ' ',
                                  //suffixText: 'USD',
                                  suffixStyle:
                                      const TextStyle(color: Colors.green)),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              child: Text('GỬI YÊU CẦU',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
