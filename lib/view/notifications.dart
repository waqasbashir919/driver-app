import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool item1 = true;
  bool item2 = false;
  bool item3 = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;
    return SafeArea(
        child: Scaffold(
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
                  'Notifications',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
                Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                topBar(
                    text: 'All (3)',
                    onClick: () {
                      setState(() {
                        item1 = true;
                        item2 = false;
                        item3 = false;
                      });
                    },
                    item: item1),
                SizedBox(
                  width: 10.w,
                ),
                topBar(
                    text: 'Generals (3)',
                    onClick: () {
                      setState(() {
                        item1 = false;
                        item2 = true;
                        item3 = false;
                      });
                    },
                    item: item2),
                SizedBox(
                  width: 10.w,
                ),
                topBar(
                    text: 'Recommendations (0)',
                    onClick: () {
                      setState(() {
                        item1 = false;
                        item2 = false;
                        item3 = true;
                      });
                    },
                    item: item3),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Clear all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: helperClass().darkRed,
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  child: Text(
                    'Mark all as read',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 98, 171, 231),
                        fontSize: 18.sp),
                  ),
                )
              ],
            ),
          ),
          notificationGroup(
              image:
                  'https://scontent.fkhi17-1.fna.fbcdn.net/v/t1.6435-9/32681721_784167745121830_7197302793575596032_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGV4Yijv6qKRntqwUWGLQxnnjb2anm5AEeeNvZqebkARykeVzw2ix3gUJ3r0YmR9xvQLzPabkGpM8oq5ran3Gp_&_nc_ohc=ePPmyg38b0EAX9m07GC&_nc_ht=scontent.fkhi17-1.fna&oh=00_AT8-I7O4uMGGYOAQR4z3f1a9WkPYWojnbAf6AtZXJSSYig&oe=634CB39D',
              text: 'Jaquline Samm',
              notification: 'Recusandae quia molestiae fugiat',
              time: '1m age'),
          notificationGroup(
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVVRGgb2FDT2k-6JVkKEHbUGFWnXFqnUBUHg&usqp=CAU',
              text: 'Dr. Darrel Schmidt',
              notification: 'Quia accusantium quam eos',
              time: '4m ago'),
          notificationGroup(
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunTrivxTkM623PCcLCN-K67QxIDRHseA62g&usqp=CAU',
              text: 'Marlon Nader',
              notification: 'Sint dicta autem',
              time: '2 days ago')
        ],
      )),
    ));
  }

  GestureDetector notificationGroup(
      {required String image, text, notification, time}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/inbox');
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          margin: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp)),
                      Text(
                        notification,
                        maxLines: 1,
                        style: TextStyle(fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 55.h,
                child: Text(
                  time,
                  style: TextStyle(color: Colors.grey, fontSize: 12.5.sp),
                ),
              ),
            ],
          )),
    );
  }

  GestureDetector topBar(
      {required String text, required Function onClick, required bool item}) {
    return GestureDetector(
      onTap: () => onClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.grey.shade300),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: item == true ? Colors.black : Colors.grey,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}
