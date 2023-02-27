import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  height: height * 0.46,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        height: height * 0.43,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color.fromARGB(31, 169, 166, 166),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Login to your account',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Text(
                                            'Username/Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          width: width * 0.57.w,
                                          height: 25.h,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Him.Kage322',
                                              hintStyle: TextStyle(
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.09,
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: helperClass().blueFillColor,
                                          ),
                                          child: Icon(Icons.lock),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: Text(
                                                  'Password',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.sp),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                width: width * 0.5.w,
                                                height: 25.h,
                                                child: TextField(
                                                  enableSuggestions: true,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Enter your password',
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
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 10.h),
                              alignment: Alignment.topRight,
                              child: Text(
                                'Forget Password ?',
                                style: TextStyle(fontSize: 15.w),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.4,
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
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'Login',
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
                  width: width * 0.8,
                  height: height * 0.07,
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
                  width: width * 0.8,
                  height: height * 0.07,
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
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ? '),
                        Text(
                          'Sign up',
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
