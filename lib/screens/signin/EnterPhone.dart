import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nail_app/screens/home/HomeScreen.dart';
import 'package:nail_app/screens/signin/EnterOTP.dart';

class EnterPhone extends StatefulWidget {
  EnterPhone({Key key}) : super(key: key);

  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final _phoneControllner = TextEditingController();
  final _codeControllner = TextEditingController();
  Future<bool> login(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Nhập mã xác thực OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeControllner,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.pink,
                      onPressed: () async {
                        final code = _codeControllner.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);
                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: height * 0.1,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("Nhập số điện thoại của bạn",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    height: 100,
                    width: 50,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/co.jpg",
                          height: 20,
                          width: 20,
                        ),
                        Text("+84"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    height: 100,
                    width: width * 0.7,
                    child: TextField(
                      controller: _phoneControllner,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Nhập số điện thoại",
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.1,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Mời bạn chọn Tiếp tục để tin nhắn SMS chứa mã OTP từ NAILSALON. Mã này được sử dụng để xác thực tài khoản đăng nhập ứng dụng ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                final phone = _phoneControllner.text.trim();
                login(phone, context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                margin:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                height: height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "TIẾP TỤC",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
