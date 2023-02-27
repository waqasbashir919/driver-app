import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kind/helper/helper.dart';
import 'package:kind/view/widgets/dismissable_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteDriver extends StatefulWidget {
  const FavoriteDriver({Key? key}) : super(key: key);

  @override
  State<FavoriteDriver> createState() => _FavoriteDriverState();
}

class _FavoriteDriverState extends State<FavoriteDriver> {
  bool isFavorite = true;

  List favourite = [
    {
      'urlAvatar':
          'https://scontent.fkhi17-1.fna.fbcdn.net/v/t1.6435-9/32681721_784167745121830_7197302793575596032_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGV4Yijv6qKRntqwUWGLQxnnjb2anm5AEeeNvZqebkARykeVzw2ix3gUJ3r0YmR9xvQLzPabkGpM8oq5ran3Gp_&_nc_ohc=ePPmyg38b0EAX9m07GC&_nc_ht=scontent.fkhi17-1.fna&oh=00_AT8-I7O4uMGGYOAQR4z3f1a9WkPYWojnbAf6AtZXJSSYig&oe=634CB39D',
      'username': 'Tia Weimann',
      'rating': 4.7
    },
    {
      'urlAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVVRGgb2FDT2k-6JVkKEHbUGFWnXFqnUBUHg&usqp=CAU',
      'username': 'Cicero Koepp',
      'rating': 4.7
    },
    {
      'urlAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunTrivxTkM623PCcLCN-K67QxIDRHseA62g&usqp=CAU',
      'username': 'Mozeil Pacocha',
      'rating': 4.7
    }
  ];
  List prioritize = [
    {
      'urlAvatar':
          'https://media.istockphoto.com/photos/smiling-man-outdoors-in-the-city-picture-id1179420343?k=20&m=1179420343&s=612x612&w=0&h=G2UGMVSzAXGAQs3pFZpvWlHNRAzwPIWIVtSOxZHsEuc=',
      'username': 'Joshua Lang',
      'rating': 4.5
    },
    {
      'urlAvatar':
          'https://image.shutterstock.com/mosaic_250/101595/1432699253/stock-photo-smiling-mature-man-wearing-spectacles-looking-at-camera-portrait-of-black-confident-man-at-home-1432699253.jpg',
      'username': 'Jaden Stracke',
      'rating': 4.0
    },
    {
      'urlAvatar':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVtOj2C3aTSeJadKw9bC-U4Q5FQTxW2dXgBxv0Sffh9rhT7tpmUFvNR_-O0WKkYRC3cqk&usqp=CAU',
      'username': 'Garfield McGlynn',
      'rating': 3.5
    }
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                Container(
                  height: height * 0.075,
                  width: width * 0.95,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('assets/menuIcon.png'),
                        fit: BoxFit.cover,
                        width: 20.w,
                      ),
                      Container(
                          child: Text(
                        'FAVOURITE DRIVERS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/wallet');
                        },
                        child: Icon(
                          Icons.home,
                          size: 25.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: width * 0.1),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = true;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: isFavorite == true
                                  ? Colors.grey.shade400
                                  : null,
                            ),
                            child: Text(
                              'FAVOURITE',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: isFavorite == true
                                  ? null
                                  : Colors.grey.shade400,
                            ),
                            child: Text(
                              'PRIORITIZE',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      isFavorite == true ? favourite.length : prioritize.length,
                  itemBuilder: (context, index) {
                    final item = isFavorite == true
                        ? favourite[index]
                        : prioritize[index];
                    return DismissableWidget(
                        index: index,
                        item: isFavorite == true ? favourite : prioritize,
                        child: buildListView(item),
                        onDismissed: (direction) =>
                            dismissItem(context, index, direction));
                  },
                )
              ],
            )),
      ),
    );
  }

  buildListView(item) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
            height: 65.h,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: NetworkImage(item['urlAvatar']),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(item['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: item['rating'],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 18.sp,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              item['rating'].toString(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    child: Icon(
                  Icons.email,
                  size: 25.sp,
                  color: helperClass().textColor,
                )),
              ],
            )),
      ],
    );
  }

  void dismissItem(
      BuildContext context, int index, DismissDirection direction) {
    setState(() {
      isFavorite == true
          ? favourite.removeAt(index)
          : prioritize.removeAt(index);
    });
  }
}
