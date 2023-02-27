import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Image(image: AssetImage('assets/logo.png'))),
                Container(
                  height: height * 0.46,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.42,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 50.h),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color.fromARGB(31, 169, 166, 166),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'OTP VERIFICATION',
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'We are sending otp on your number to verify your number +92312****036',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 10.h),
                              alignment: Alignment.center,
                              child: Text(
                                'Please enter your code',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            Form(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: height * 0.06.h,
                                    width: height * 0.06.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (pin1) {},
                                      style: TextStyle(fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0',
                                          hintStyle:
                                              TextStyle(fontSize: 20.sp)),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: height * 0.06.h,
                                    width: height * 0.06.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (pin1) {},
                                      style: TextStyle(fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(fontSize: 20.sp),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: height * 0.06.h,
                                    width: height * 0.06.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (pin1) {},
                                      style: TextStyle(fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(fontSize: 20.sp),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: height * 0.06.h,
                                    width: height * 0.06.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (pin1) {},
                                      style: TextStyle(fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(fontSize: 20.sp),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.39,
                        left: 60.w,
                        right: 60.w,
                        child: Container(
                            alignment: Alignment.center,
                            width: 140.w,
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                color: helperClass().fillColor,
                                borderRadius: BorderRadius.circular(30.r)),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/vehicle_inspection');
                              },
                              child: Text(
                                'VERIFY',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  alignment: Alignment.center,
                  child: Text(
                    'Didn\'t get code?',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Resend code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
