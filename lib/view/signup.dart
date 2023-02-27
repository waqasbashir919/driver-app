import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Image(image: AssetImage('assets/logo.png'))),
                Container(
                  height: height * 0.70,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.68,
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color.fromARGB(31, 169, 166, 166),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Register your account to',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            userTextfieldGroup(
                              width: width,
                              prefixIcon: Icons.person,
                              keys: 'Username/Email',
                              hintText: 'Him.Kage322',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            passTextfieldGroup(
                                width: width,
                                prefixIcon: Icons.lock,
                                keys: 'Password',
                                hintText: 'Enter your password',
                                passwordIcon: Icons.visibility),
                            SizedBox(height: 15.h),
                            passTextfieldGroup(
                                width: width,
                                prefixIcon: Icons.lock,
                                keys: 'Confirm password',
                                hintText: 'Enter your password',
                                passwordIcon: Icons.visibility),
                            SizedBox(
                              height: 15.h,
                            ),
                            userTextfieldGroup(
                              width: width,
                              prefixIcon: Icons.phone_in_talk_rounded,
                              keys: 'Phone number',
                              hintText: 'Enter phone number',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  splashRadius: 20.r,
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    'I agree to terms and condition and privacy policy',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.64,
                        left: 60.w,
                        right: 60.w,
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                color: helperClass().fillColor,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/otp');
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: width * 0.8.w,
                  height: height * 0.07.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(31, 169, 166, 166),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                        width: 25.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 15.w),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: width * 0.8.w,
                  height: height * 0.07.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(31, 169, 166, 166),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 25.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(fontSize: 15.w),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account ? '),
                        Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class passTextfieldGroup extends StatelessWidget {
  const passTextfieldGroup(
      {Key? key,
      required this.width,
      required this.keys,
      required this.hintText,
      required this.prefixIcon,
      required this.passwordIcon})
      : super(key: key);

  final double width;
  final String keys, hintText;
  final IconData prefixIcon, passwordIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: width * 0.09,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: helperClass().blueFillColor,
                  ),
                  child: Icon(Icons.lock),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          keys,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        width: width * 0.5.w,
                        height: 25.h,
                        child: TextField(
                          enableSuggestions: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
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
          Icon(Icons.visibility)
        ],
      ),
    );
  }
}

class userTextfieldGroup extends StatelessWidget {
  const userTextfieldGroup(
      {Key? key,
      required this.width,
      required this.keys,
      required this.hintText,
      required this.prefixIcon})
      : super(key: key);

  final double width;
  final String keys, hintText;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.09,
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: helperClass().blueFillColor,
            ),
            child: Icon(Icons.person),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: width * 0.4.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    keys,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  // width: width * 0.47.w,
                  height: 25.h,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
