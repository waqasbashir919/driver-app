import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key, required this.isSidebar}) : super(key: key);
  final bool isSidebar;
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List items = [
    {
      'img': 'test',
      'text': 'test',
    },
    {
      'img': 'assets/carImg.png',
      'text': 'Ride history',
    },
    {
      'img': 'assets/walletImg.png',
      'text': 'Wallet',
    },
    {
      'img': 'assets/heartImg.png',
      'text': 'Messages',
    },
    {
      'img': 'assets/inviteImg.png',
      'text': 'Invite',
    },
    {
      'img': 'assets/helpImg.png',
      'text': 'Help',
    },
    {
      'img': 'assets/settingImg.png',
      'text': 'Setting',
    },
    {
      'img': 'assets/logoutImg.png',
      'text': 'Log out',
    }
  ];
  bool isSidebar = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DraggableScrollableSheet(
            initialChildSize: widget.isSidebar == true
                ? isSidebar == false
                    ? 0
                    : 0.7.sp
                : 0,
            minChildSize: widget.isSidebar == true
                ? isSidebar == false
                    ? 0
                    : 0.7.sp
                : 0,
            maxChildSize: widget.isSidebar == true
                ? isSidebar == false
                    ? 0
                    : 0.75.sp
                : 0,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.r))),
                child: ListView.builder(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 50.w,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                padding:
                                                    EdgeInsets.only(top: 10.h),
                                                child: CircleAvatar(
                                                  radius: 40.r,
                                                  backgroundImage: NetworkImage(
                                                      'https://scontent.fkhi17-1.fna.fbcdn.net/v/t1.6435-9/32681721_784167745121830_7197302793575596032_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGV4Yijv6qKRntqwUWGLQxnnjb2anm5AEeeNvZqebkARykeVzw2ix3gUJ3r0YmR9xvQLzPabkGpM8oq5ran3Gp_&_nc_ohc=ePPmyg38b0EAX9m07GC&_nc_ht=scontent.fkhi17-1.fna&oh=00_AT8-I7O4uMGGYOAQR4z3f1a9WkPYWojnbAf6AtZXJSSYig&oe=634CB39D'),
                                                )),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              'Nikita Predovic',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSidebar = false;
                                      });
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 30.w),
                                        child: SizedBox(
                                            width: 10.w,
                                            child: Icon(
                                              Icons.cancel,
                                              size: 25.sp,
                                            ))),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          ),
                        );
                      } else {
                        return RideSelectGroup(index: index, items: items);
                      }
                    }),
              );
            }));
  }

  Container RideSelectGroup({required int index, required List items}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          index == 6
              ? Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.h,
                  ),
                )
              : SizedBox(),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Image(
                  width: 32.w,
                  fit: BoxFit.fill,
                  image: AssetImage(items[index]['img']),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    items[index]['text'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
