import 'package:flutter/material.dart';

class EnterOTP extends StatefulWidget {
  EnterOTP({Key key}) : super(key: key);

  @override
  _EnterOTPState createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: height * 0.05,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text("Quay lại"),
                            ),
                          ],
                        )),
                    Container(
                        child: Center(
                            child: Text("Xác thực tài khoản",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
