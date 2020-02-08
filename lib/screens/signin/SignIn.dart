import 'package:flutter/material.dart';
import 'package:nail_app/screens/signin/EnterPhone.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Colors.pink,
            title: Center(
              child: Text("My Nail Salon",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  child: SizedBox(
                    height: 60.0,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text('Đăng nhập bằng số điện thoại',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EnterPhone()));
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/home', (_) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
