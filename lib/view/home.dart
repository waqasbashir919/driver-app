import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kind/helper/helper.dart';
import 'package:kind/view/sidebar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const double _defaultLat = 37.42796133580664;
  static const double _defaultLng = -122.085749655962;

  static CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 14);
  int selectedRadioButton = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.075,
              width: width * 0.95,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return NewRide();
                            });
                      },
                      child: Image(image: AssetImage('assets/menuIcon.png'))),
                  Container(
                      child: Image(
                    height: height * 0.035,
                    image: AssetImage('assets/kind.png'),
                    fit: BoxFit.cover,
                  )),
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: helperClass().fillColor),
                    child: Row(children: [
                      Image(image: AssetImage('assets/ellipseImg.png')),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('Online')
                    ]),
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 25,
                      color: Colors.grey.shade300)
                ]),
                padding: EdgeInsets.all(20.sp),
                height: MediaQuery.of(context).size.height / 2.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Container(
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: _defaultLocation,
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        new Factory<OneSequenceGestureRecognizer>(
                          () => new EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                    ),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ACTIVE RIDE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 7.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.grey.shade300,
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Text('\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp)),
                              Text('132',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunTrivxTkM623PCcLCN-K67QxIDRHseA62g&usqp=CAU'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Darrel Schmidt',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey.shade400,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.chair,
                                            size: 25.sp,
                                          ),
                                          Text(' 1 seat',
                                              style:
                                                  TextStyle(fontSize: 18.sp)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey.shade400,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.pets,
                                            size: 25.sp,
                                          ),
                                          Text('Talking pet',
                                              style:
                                                  TextStyle(fontSize: 18.sp)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('From',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                              ),
                              AutoSizeText('West Chester Jeroding',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                        fontSize: 16.sp)),
                              ),
                              AutoSizeText('Von Cape shireening',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Text(
                'RECENT RIDES:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            recentRides(
                urlAvatar:
                    'https://media.gettyimages.com/photos/happy-hispanic-woman-against-white-background-picture-id1314490179?k=20&m=1314490179&s=612x612&w=0&h=LKK2S_nOz-5_S139t3L7KpFx9N90uO9qb5ymm6gVusM=',
                username: 'Bethany Spinka',
                from: 'West Chester Jeroding',
                to: 'Von Cape shireening'),
            recentRides(
                urlAvatar:
                    'https://media.istockphoto.com/photos/happy-laughing-man-picture-id544358212?b=1&k=20&m=544358212&s=170667a&w=0&h=e1uHtcDJ7yZCgZtby_XHySquR03Bu-NkMxYMleIUTIQ=',
                username: 'Bethany Spinka',
                from: 'West Chester Jeroding',
                to: 'Von Cape shireening'),
            recentRides(
                urlAvatar:
                    'https://media.gettyimages.com/id/1179420343/photo/smiling-man-outdoors-in-the-city.webp?s=612x612&w=gi&k=20&c=n663L5A4XlwcUvNpX_eu4ur1sMmrD6dt_c1mbWjrLXk=',
                username: 'Bethany Spinka',
                from: 'West Chester Jeroding',
                to: 'Von Cape shireening'),
          ]),
        ),
      ),
    );
  }

  SingleChildScrollView recentRides(
      {required String urlAvatar, username, from, to}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(urlAvatar),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  child: Text(
                    username,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('From',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                          ),
                          AutoSizeText(from,
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
                          AutoSizeText(to,
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey.shade300,
              ),
              child: Container(
                child: Row(
                  children: [
                    Text('\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp)),
                    Text('124',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewRide extends StatefulWidget {
  NewRide({
    Key? key,
  }) : super(key: key);

  @override
  State<NewRide> createState() => _NewRideState();
}

class _NewRideState extends State<NewRide> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;

    return SimpleDialog(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'YAY, NEW RIDE !!!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                alignment: Alignment.center,
                child: Text(
                  'YOU WANNA GO ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.sp, color: Color.fromARGB(255, 91, 90, 90)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'RIDE INFO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: helperClass().textColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunTrivxTkM623PCcLCN-K67QxIDRHseA62g&usqp=CAU'),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text('Dr. Darrel Schmidt',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'RIDE DETAIL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.grey.shade300,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Text('\$',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                                Text('132',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.grey.shade300,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: 20.sp,
                                ),
                                Text('30 min',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Colors.grey.shade300,
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_searching,
                                  size: 20.sp,
                                ),
                                Text('1.2km',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text('Seats:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp)),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '(Per seat cost +5\$)',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.grey.shade300,
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.chair,
                                      size: 20.sp,
                                    ),
                                    Text(' 1 seat',
                                        style: TextStyle(fontSize: 16.sp)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('Pets:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.grey.shade300,
                              ),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.pets,
                                      size: 20.sp,
                                    ),
                                    Text(' 1 pet',
                                        style: TextStyle(fontSize: 16.sp)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            width: 15,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(186, 242, 103, 136),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Color.fromARGB(255, 239, 36, 21)),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return MyDialogue();
                          });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 120.w,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color: helperClass().fillColor,
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Text(
                          'GET RIDE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        )),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyDialogue extends StatefulWidget {
  const MyDialogue({Key? key}) : super(key: key);

  @override
  State<MyDialogue> createState() => _MyDialogueState();
}

class _MyDialogueState extends State<MyDialogue> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;

    return SimpleDialog(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'AWESOME!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
              ),
              Container(
                child: Text(
                  'YOU GOT REVIEW.',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 32.sp,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      // initialRating =
                      //     rating;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.shade300,
                ),
                child: Text('Awesome ride! want to go with him again',
                    style: TextStyle(fontSize: 16.sp)),
              ),
              Text(
                'YOU GOT TIP.',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.shade300,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp)),
                      Text('10',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                  alignment: Alignment.center,
                  width: 140.w,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: helperClass().fillColor,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/pickup');
                    },
                    child: Text(
                      'OKAY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
