import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kind/view/sidebar.dart';

class PickupConfirmation extends StatefulWidget {
  const PickupConfirmation({Key? key}) : super(key: key);

  @override
  State<PickupConfirmation> createState() => _PickupConfirmationState();
}

class _PickupConfirmationState extends State<PickupConfirmation> {
  static const double _defaultLat = 37.42796133580664;
  static const double _defaultLng = -122.085749655962;

  static CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 14);

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  double initialRating = 1;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  bool isConfirm = false;
  bool isSidebar = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;

    return Scaffold(
      body: Stack(children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
              height: constraints.maxHeight / 1.h,
              child: GoogleMap(
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: _defaultLocation,
                onMapCreated: (controller) => _googleMapController = controller,
                markers: {
                  if (_origin != null) _origin!,
                  if (_destination != null) _destination!
                },
                onLongPress: _addMarker,
              ));
        }),
        Positioned(
          top: height * 0.045.h,
          left: width * 0.02.w,
          right: width * 0.02.w,
          child: Container(
            width: width * 0.95.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isSidebar = !isSidebar;
                      });
                    },
                    child: Image(
                      image: AssetImage('assets/menuIcon.png'),
                      width: 18.sp,
                    )),
                Container(
                    child: Image(
                  height: height * 0.035.h,
                  image: AssetImage('assets/kind.png'),
                  fit: BoxFit.cover,
                )),
                Icon(
                  Icons.notifications,
                  size: 25.sp,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.132.h,
          left: width * 0.02.w,
          right: width * 0.02.w,
          child: Container(
            // height: height * 0.05.h,
            height: 36.h,
            width: width * 0.95.w,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: FittedBox(
                    child: Text(
                      '80703-1046 West Chester Jerod Haven Union',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                  ),
                ),
                Icon(
                  Icons.location_searching_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        _origin != null
            ? Positioned(
                top: height * 0.2.h,
                left: width * 0.02.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: _origin!.position, tilt: 50, zoom: 17)));
                    },
                    child: Text(
                      'Origin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.black),
                    )))
            : Container(),
        _destination != null
            ? Positioned(
                top: height * 0.2.h,
                right: width * 0.02.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: _destination!.position,
                              tilt: 50,
                              zoom: 17)));
                    },
                    child: Text(
                      'Destination',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.black),
                    )))
            : Container(),
        Positioned(
          bottom: height * 0.15.w,
          right: width * 0.05.w,
          child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(_defaultLocation)),
              child: Icon(
                Icons.location_searching,
                color: Colors.black,
              )),
        ),
        DraggableScrollableSheet(
            initialChildSize: isConfirm == false ? 0.155 : 0.2,
            minChildSize: isConfirm == false ? 0.155 : 0.2,
            maxChildSize: isConfirm == false ? 0.48 : 0.66,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.r))),
                child: ListView.builder(
                    controller: scrollController,
                    physics: ClampingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 15.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.r))),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h, horizontal: 15.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text('From',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp)),
                                              ),
                                              Container(
                                                child: Container(
                                                  child: Text(
                                                    'West Chester Jeroding',
                                                    style: TextStyle(
                                                        fontSize: 16.sp),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7.h, horizontal: 15.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text('To',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp)),
                                              ),
                                              Container(
                                                child: Text(
                                                  'Von Cape shireening',
                                                  style: TextStyle(
                                                      fontSize: 16.sp),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  isConfirm == true
                                                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunTrivxTkM623PCcLCN-K67QxIDRHseA62g&usqp=CAU'
                                                      : 'https://media.gettyimages.com/photos/happy-hispanic-woman-against-white-background-picture-id1314490179?k=20&m=1314490179&s=612x612&w=0&h=LKK2S_nOz-5_S139t3L7KpFx9N90uO9qb5ymm6gVusM='),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                                isConfirm == true
                                                    ? 'Dr. Darrel Schmidt'
                                                    : 'Alysa Lubowitz',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          isConfirm == true ? '' : '0.1km left',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Color.fromARGB(
                                                  255, 120, 118, 118),
                                              fontStyle: FontStyle.italic))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Ride detail:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.h,
                                                horizontal: 15.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text('\$',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20.sp)),
                                                  Text('132',
                                                      style: TextStyle(
                                                          fontSize: 18.sp)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.h,
                                                horizontal: 15.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons.access_time_filled),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text('30 min',
                                                      style: TextStyle(
                                                          fontSize: 18.sp)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.h,
                                                horizontal: 15.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_searching,
                                                    size: 25.sp,
                                                  ),
                                                  Text('1.2km',
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            isConfirm == true
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Seats:',
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
                                                  vertical: 7.h,
                                                  horizontal: 10.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
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
                                                        style: TextStyle(
                                                            fontSize: 16.sp)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            isConfirm == true
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  vertical: 7.h,
                                                  horizontal: 10.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
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
                                                        style: TextStyle(
                                                            fontSize: 16.sp)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  isConfirm == true
                                      ? showDialog(
                                          context: context,
                                          builder: (context) {
                                            return MyDialogue();
                                          })
                                      : null;
                                  setState(() {
                                    isConfirm = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                      color: helperClass().fillColor,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20.r))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SEND MESSAGE ',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              );
            }),
        isSidebar == true ? Sidebar(isSidebar: isSidebar) : SizedBox()
      ]),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
            markerId: MarkerId('Origin'),
            infoWindow: InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
            markerId: MarkerId('Destination'),
            infoWindow: InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });
    }
  }
}

class MyDialogue extends StatefulWidget {
  const MyDialogue({Key? key}) : super(key: key);

  @override
  State<MyDialogue> createState() => _MyDialogueState();
}

class _MyDialogueState extends State<MyDialogue> {
  int selectedRadioButton = 1;
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
                'AWESOME!!!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              SizedBox(height: 5.h),
              Container(
                child: Text(
                  'YOU REACHED AT YOUR DESTINATION',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    width: width / 3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 155, 148),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.black),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            '100',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    width: width / 3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Extra fare:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter here',
                              hintStyle: TextStyle(fontSize: 14.sp),
                              border: InputBorder.none,
                              isDense: true),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        color: selectedRadioButton == 2
                            ? helperClass().fillColor
                            : helperClass().fillColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Cash',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        )),
                        Radio(
                            activeColor: helperClass().textColor,
                            value: 2,
                            groupValue: selectedRadioButton,
                            onChanged: ((value) {
                              setState(() {
                                selectedRadioButton = value as int;
                              });
                            })),
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.only(left: 5.w),
                    decoration: BoxDecoration(
                        color: selectedRadioButton == 1
                            ? helperClass().fillColor
                            : helperClass().fillColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Card',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        )),
                        Radio(
                            activeColor: helperClass().textColor,
                            value: 1,
                            groupValue: selectedRadioButton,
                            onChanged: ((value) {
                              setState(() {
                                selectedRadioButton = value as int;
                              });
                            })),
                      ],
                    ),
                  ),
                ],
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
                      Navigator.pushNamed(context, '/main_driver');
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
