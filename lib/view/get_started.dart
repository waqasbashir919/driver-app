import 'package:flutter/material.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              width: width.w,
              child: Image(
                image: AssetImage('assets/getStarted.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Lets get started catch a cab',
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      child: Text(
                    'Consequatur placeat necessitatibus sar[e facere magni quaerat. Moiestiae paritur asperiores praesentium neque minus et qui. Asperiores quasi repeliendus ut earum voluptas hic. Earum praesentium sunt culpa',
                    style: TextStyle(
                        color: helperClass().textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(
                      width: 185.w,
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          color: helperClass().fillColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'GET STARTED',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18.sp,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
