import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2000),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: (Image.asset(
          'resimler/mcdonald.png',
          width: 80,
          height: 80,
        ))
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            first(context),
            second(context),
          ],
        ),
      ),
    );
  }
}

Widget first(BuildContext context) {
  double ph_height = MediaQuery.of(context).size.height;

  return Container(
    color: Colors.blue,
    height: ph_height / 2,
    child: Center(child: (Image.asset('resimler/mcdonald.png'))),
  );
}

Widget second(BuildContext context) {
  Color primaryColor = Colors.blue;

  const textStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget inputs = Container(
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
    child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid
              ),
            ),
          ),
        ),
        //const SizedBox(
         // height: 5,
        //),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid
              ),
            ),
          ),
          obscureText: true,
        ),
      ],
    ),
  );

  Widget askTextForgotPassword = const Padding(
    padding: EdgeInsets.all(5),
    child: Text(
      'Forgot your password?',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  Widget submitButton = Padding(
    padding: const EdgeInsets.all(3),
    child: Material(
      color: Colors.transparent,
      elevation: 20,
      shadowColor: Theme.of(context).primaryColor,
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
          child: const Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    ),
  );

  return Column(
    children: [
      DefaultTextStyle.merge(
        style: textStyle,
        child: Container(
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'LOG IN',
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      inputs,
      askTextForgotPassword,
      submitButton,
    ],
  );
}


