import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverReview extends StatefulWidget {
  const DriverReview({Key? key}) : super(key: key);

  @override
  State<DriverReview> createState() => _DriverReviewState();
}

class _DriverReviewState extends State<DriverReview> {
  double initialRating = 1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              children: [
                Container(
                  height: height * 0.075.h,
                  width: width * 0.95.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 25.sp,
                        ),
                      ),
                      Container(
                          child: Image(
                        height: height * 0.035.h,
                        image: AssetImage('assets/kind.png'),
                        fit: BoxFit.cover,
                      )),
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    'Your driver',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: NetworkImage(
                      'https://scontent.fkhi17-1.fna.fbcdn.net/v/t1.6435-9/32681721_784167745121830_7197302793575596032_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGV4Yijv6qKRntqwUWGLQxnnjb2anm5AEeeNvZqebkARykeVzw2ix3gUJ3r0YmR9xvQLzPabkGpM8oq5ran3Gp_&_nc_ohc=ePPmyg38b0EAX9m07GC&_nc_ht=scontent.fkhi17-1.fna&oh=00_AT8-I7O4uMGGYOAQR4z3f1a9WkPYWojnbAf6AtZXJSSYig&oe=634CB39D'),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Text('Efrain Brakus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: initialRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.sp,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          initialRating = rating;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      initialRating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.grey.shade300),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                  child: Text(
                    'Add to favorite',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    'Add a tip',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade600,
                        fontSize: 18.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    tipWidget(value: '2\$'),
                    tipWidget(value: '3\$'),
                    tipWidget(value: '5\$'),
                    tipWidget(value: '6\$')
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Custom tip',
                          hintStyle: TextStyle(fontSize: 20.sp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none)),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Text(
                    'Drop a review',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade700,
                        fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                RatingBar.builder(
                  initialRating: initialRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 35.sp,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      initialRating = rating;
                    });
                  },
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      maxLines: 9,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          hintText: 'Say something about driver!',
                          hintStyle: TextStyle(fontSize: 20.sp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none)),
                    )),
                Container(
                    alignment: Alignment.center,
                    width: 140.w,
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        color: helperClass().fillColor,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade700,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container tipWidget({required String value}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: Colors.grey.shade300),
      padding: EdgeInsets.all(15.sp),
      child: Text(
        value,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20.sp),
      ),
    );
  }
}
