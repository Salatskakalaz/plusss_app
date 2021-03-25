import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatelessWidget {
  final String number;

  const OTPScreen({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('OTP Tekshiruvi'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/image/log.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Kodingizni',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                number,
                style: TextStyle(fontSize: 30, color: Colors.blueGrey),
              ),
              Text(
                'raqamiga yubordik',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ushbu kod muddati tugaydi'),
                  SizedBox(width: 10),
                  TimeSeconds(),
                ],
              ),

              Container(padding: EdgeInsets.symmetric(horizontal:50, vertical: 10),
              child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 25, color: Colors.black),
                  colorBuilder: FixedColorBuilder(Colors.teal.withOpacity(0.3)),
                ),
                codeLength: 4,
                onCodeChanged: (val){
                  print(val);
                },
              ),
              ),

              // SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 100),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 1,
              //         child: OTPWidget(),
              //       ),
              //       SizedBox(width: 10),
              //       Expanded(
              //         flex: 1,
              //         child: OTPWidget(),
              //       ),
              //       SizedBox(width: 10),
              //       Expanded(
              //         flex: 1,
              //         child: OTPWidget(),
              //       ),
              //       SizedBox(width: 10),
              //       Expanded(
              //         flex: 1,
              //         child: OTPWidget(),
              //       ),
              //       SizedBox(width: 10),
              //       Expanded(
              //         flex: 1,
              //         child: OTPWidget(),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

class OTPWidget extends StatefulWidget {
  @override
  _OTPWidgetState createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: pin2FocusNode,
      autofocus: true,
      obscureText: true,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: '0',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
      onChanged: (value) {
        nextField(value: value, focusNode: pin2FocusNode);
      },
    );
  }
}

class TimeSeconds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 50, end: 0),
        duration: Duration(seconds: 50),
        builder: (context, value, child) => Text(
          '00:${value.toInt()}',
          style: TextStyle(color: Colors.redAccent, fontSize: 17),
        ),
      ),
    );
  }
}
