import 'package:flutter/material.dart';
import 'package:kind/view/choose_app.dart';
import 'package:kind/view/driver_review.dart';
import 'package:kind/view/favorite_dirver.dart';
import 'package:kind/view/get_started.dart';
import 'package:kind/view/home.dart';
import 'package:kind/view/inbox.dart';
import 'package:kind/view/login.dart';
import 'package:kind/view/main_driver.dart';
import 'package:kind/view/message.dart';
import 'package:kind/view/notifications.dart';
import 'package:kind/view/otp.dart';
import 'package:kind/view/pickup_confirmation.dart';
import 'package:kind/view/signup.dart';
import 'package:kind/view/vehicle_inspection.dart';
import 'package:kind/view/wallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(360, 720),
    builder: ((context, child) => MaterialApp(
          initialRoute: './',
          routes: {
            './': ((context) => Login()),
            '/signup': ((context) => SignUp()),
            '/otp': ((context) => Otp()),
            '/vehicle_inspection': ((context) => VehicleInspection()),
            '/home': ((context) => Home()),
            '/main_driver': ((context) => MainDriver()),
            '/pickup': ((context) => PickupConfirmation()),
            '/notification': ((context) => NotificationsPage()),
            '/inbox': ((context) => Inbox()),
            '/messages': ((context) => Messages()),
          },
        )),
  ));
}
