import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  var listItem = helperClass().inbox;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height.h;
    var width = MediaQuery.of(context).size.width.w;
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child: Column(children: [
          Container(
            height: height * 0.075,
            width: width * 0.95,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.symmetric(vertical: 10.h),
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
                  'INBOX',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
                Icon(
                  Icons.home,
                  size: 25.sp,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.h, horizontal: 0.w),
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 18.sp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none)),
                    )),
              ),
              Icon(
                Icons.more_vert,
                size: 25.sp,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listItem.length,
              itemBuilder: (BuildContext context, int index) {
                var item = listItem[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/messages',
                        arguments: {'index': index});
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.sp),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item['urlAvatar']),
                                  radius: 25.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(item['username'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item['message'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: (index == 0 || index == 3 || index == 4)
                                  ? helperClass().textColor
                                  : null,
                            ),
                            child: Text(
                              (index == 0 || index == 3 || index == 4)
                                  ? '2'
                                  : '',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ),
                        ],
                      )),
                );
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
