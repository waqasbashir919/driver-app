import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:kind/view/sidebar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String message = '';
  TextEditingController messageController = TextEditingController();
  List messages = [
    'Yeah, Right! As if that would hallen!',
    'Anyone gotta roll, G\'night!',
    'Good night',
    'Wassup',
    'So what i miss yesterder',
    'So, while youe were gone, a lot has happened. Let me give you a brief idea',
    'Good morning',
    'Notalie from HR cam to our floor looking for Steven Rmember the mistake he had made last week? It was definitely related to this!!!',
    'You knwo about this right',
    'So, while youe were gone, a lot has happened. Let me give you a brief idea'
  ];
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  var username = helperClass().inbox;
  Map data = {};

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height.h;
    var width = MediaQuery.of(context).size.width.w;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: Column(
        children: [
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
                GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Image(
                      image: AssetImage('assets/menuIcon.png'),
                      width: 18.sp,
                      fit: BoxFit.cover,
                    )),
                Container(
                    child: Text(
                  username[data['index']]['username'],
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pickup');
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
          Expanded(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: list[index] % 2 == 0
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 20.w,
                          maxWidth: 200.w,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: list[index] % 2 == 0
                              ? Colors.grey.shade300
                              : helperClass().textColor,
                        ),
                        child: Text(
                          messages[index].toString(),
                          style: TextStyle(
                              color: list[index] % 2 == 0
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18.sp),
                        ),
                      )
                    ],
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 25.sp,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: TextField(
                      controller: messageController,
                      autocorrect: true,
                      enableSuggestions: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.attachment,
                            size: 25.sp,
                          ),
                          hintText: 'Type here',
                          hintStyle: TextStyle(fontSize: 18.sp),
                          border: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.mic,
                      size: 25.sp,
                    )),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
