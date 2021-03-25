import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/otp_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.teal),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
        primarySwatch: Colors.teal,
      ),
      home: AuthorizationPage(),
    );
  }
}

class AuthorizationPage extends StatelessWidget {
  final nameCon = TextEditingController();
  final codePhone = TextEditingController(text: '+998');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sizning telefoningiz'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: TextEditingController(text: 'O\'zbekiston'),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        controller: codePhone,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: 310,
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: nameCon,
                      decoration: InputDecoration(
                        hintText: '- -  - - - - - - -',
                      ),
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Iltimos, telefon raqamingizni kiriting',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OTPScreen(
                number: codePhone.text + nameCon.text,
              )));
        },
        child: Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
