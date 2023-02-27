import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:kind/helper/helper.dart';
import 'package:kind/view/login.dart';

class ChooseApp extends StatelessWidget {
  const ChooseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fitWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Image(image: AssetImage('assets/logo.png'))),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: helperClass().fillColor,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Choose your app',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.drive_eta_rounded,
                          color: helperClass().textColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        label: Text('Driver App'),
                        style: ElevatedButton.styleFrom(
                            primary: helperClass().fillColor),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.person,
                          color: helperClass().textColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/get_started');
                        },
                        label: Text('User App'),
                        style: ElevatedButton.styleFrom(
                            primary: helperClass().fillColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
