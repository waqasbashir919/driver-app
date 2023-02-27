import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:kind/helper/helper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideHistory extends StatefulWidget {
  const RideHistory({Key? key}) : super(key: key);

  @override
  State<RideHistory> createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
          child: Column(
        children: [
          Container(
            height: height * 0.075.h,
            width: width * 0.95.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.shade300,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/menuIcon.png'),
                  width: 18.sp,
                  fit: BoxFit.cover,
                ),
                Container(
                    child: Text(
                  'RIDE HISTORY',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
            child: Text(
              '3rd September 2019',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
          Container(
            width: width * 0.9,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image(image: AssetImage('assets/ellipseImg.png')),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                height: 55.h,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  dashGapLength: 5,
                                  lineThickness: 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text('08:43 PM')),
                          SizedBox(
                            width: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('From',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('West Chester Jeroding',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('To',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('Von Cape shireening',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image(image: AssetImage('assets/ellipseImg.png')),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                height: 55.h,
                                child: DottedLine(
                                  direction: Axis.vertical,
                                  dashGapLength: 5,
                                  lineThickness: 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text('09:32 PM')),
                          SizedBox(
                            width: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('From',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('Ezra Pine Land',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('To',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('Friedrich Chester',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image(image: AssetImage('assets/ellipseImg.png')),
                            ],
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text('12:12 AM')),
                          SizedBox(
                            width: 5.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('From',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('Jenkins Highway',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                width: 110.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade400,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('To',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp)),
                                    ),
                                    AutoSizeText('Toy Centers Fort',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
            child: Text(
              '11th December 2019',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            width: width * 0.9,
            child: Row(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage('assets/ellipseImg.png')),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text('05:44 PM')),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 110.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text('From',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                                AutoSizeText('Skiles Squares',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: 110.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text('To',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                                AutoSizeText('Cassandre Park',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
