import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kind/helper/helper.dart';

class VehicleInspection extends StatefulWidget {
  const VehicleInspection({Key? key}) : super(key: key);

  @override
  State<VehicleInspection> createState() => _VehicleInspectionState();
}

class _VehicleInspectionState extends State<VehicleInspection> {
  List vehicleDetails = [
    {'title': 'Vehicle name', 'value': 'Honda civic'},
    {'title': 'No of seats', 'value': 'Enter seats'},
    {'title': 'Amenities', 'value': 'Select'},
    {'title': 'Vehicle number', 'value': 'Enter number'},
    {'title': 'License number', 'value': 'Enter number'},
    {'title': 'License document', 'value': 'Upload'},
    {'title': 'License expiry date', 'value': 'Select date'},
    {'title': 'Insurance number', 'value': 'Enter number'},
    {'title': 'Insurance document', 'value': 'Upload'},
    {'title': 'Insurance expiry', 'value': 'Select date'},
    {'title': 'RC book number', 'value': 'Enter number'},
    {'title': 'RC book document', 'value': 'Upload'},
    {'title': 'RC book expiry', 'value': 'Select date'},
  ];
  String dropdownValue1 = 'Select seats';
  String dropdownValue2 = 'Select';
  int selecteValue = 1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height.h;
    var width = MediaQuery.of(context).size.width.w;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15.w, right: 10.w),
          child: Column(
            children: [
              Container(
                  width: width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                  child: Image(image: AssetImage('assets/logo.png'))),
              Container(
                constraints: BoxConstraints(
                  minHeight: selecteValue == 1
                      ? height * 1.7
                      : selecteValue == 2
                          ? height * 1.58
                          : height * 1.58,
                  maxHeight: selecteValue == 1
                      ? height * 1.9
                      : selecteValue == 2
                          ? height * 2
                          : height * 2,
                ),
                // height: selecteValue == 1
                //     ? height * 1.62
                //     : selecteValue == 2
                //         ? height * 1.33
                //         : height * 1.33,
                child: Stack(
                  children: [
                    Container(
                      // height: selecteValue == 1
                      //     ? height * 1.52
                      //     : selecteValue == 2
                      //         ? height * 1.27
                      //         : height * 1.27,
                      constraints: BoxConstraints(
                        minHeight: selecteValue == 1
                            ? height * 1.01
                            : selecteValue == 2
                                ? height * 1.52
                                : height * 1.52,
                        maxHeight: selecteValue == 1
                            ? height * 1.65
                            : selecteValue == 2
                                ? height * 2
                                : height * 2,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.h),
                              bottom: Radius.circular(20.h))),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(children: [
                          Container(
                            child: Text(
                              'Inspection',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.sp),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Text(
                              'Few simple steps to get inspected',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteValue = 1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Vehicle details',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: selecteValue == 1
                                              ? helperClass().textColor
                                              : Color.fromRGBO(0, 74, 43, 1)
                                                  .withOpacity(0.4)),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minWidth: 30.w, maxWidth: 100.w),
                                      child: Divider(
                                        thickness: 3.h,
                                        color: selecteValue == 1
                                            ? helperClass().textColor
                                            : Color.fromRGBO(0, 74, 43, 1)
                                                .withOpacity(0.4),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteValue = 2;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Payment details',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: selecteValue == 2
                                              ? helperClass().textColor
                                              : Color.fromRGBO(0, 74, 43, 1)
                                                  .withOpacity(0.4)),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minWidth: 30.w, maxWidth: 100.w),
                                      child: Divider(
                                        thickness: 3.h,
                                        color: selecteValue == 2
                                            ? helperClass().textColor
                                            : Color.fromRGBO(0, 74, 43, 1)
                                                .withOpacity(0.4),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteValue = 3;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Security deposite',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: selecteValue == 3
                                              ? helperClass().textColor
                                              : Color.fromRGBO(0, 74, 43, 1)
                                                  .withOpacity(0.4)),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          minWidth: 30.w, maxWidth: 100.w),
                                      child: Divider(
                                        thickness: 3.h,
                                        color: selecteValue == 3
                                            ? helperClass().textColor
                                            : Color.fromRGBO(0, 74, 43, 1)
                                                .withOpacity(0.4),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                          selecteValue == 1
                              ? vehicleDetail(height, width)
                              : selecteValue == 2
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 20.h),
                                      margin: EdgeInsets.all(15.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'A coaching contract is a document that sets the terms of the relationship between the coach and the client. Every coaching contract may be different in terms of the capacity of the coach to provide coaching services, as well as the client who intends to receive the coaching service. The relationship created in this kind of contract is usually a non-legally binding partnership. There is no concrete goal in this aspect that can be accomplished by the coach and for this reason that there can be no cause for legal effects for those that are unreached but desired. This agreement is primarily designed to create and develop strategies through collaboration by the parties where the coach supports the client in establishing proper behavior in every challenge.This Coaching Contract PDF Template is a quick PDF instrument that is instantly created as a downloadable and printable file after submission from the form that it comes with. This template is easy to modify to your desired layout. The options and features available on the PDF editor are easy to use. Modify the contents laying out the design in a WYSIWYG manner. Information submitted through the form is stored in a database and can be reused. A design change on the template after a download of the document? No problem! Just edit the content and download again the PDF and you have the information in a new layout. Take advantage of the tools and features that Jotform offers. Use this Coaching Contract PDF template here in Jotform!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: helperClass().textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 20.h),
                                      margin: EdgeInsets.all(15.sp),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'A coaching contract is a document that sets the terms of the relationship between the coach and the client. Every coaching contract may be different in terms of the capacity of the coach to provide coaching services, as well as the client who intends to receive the coaching service. The relationship created in this kind of contract is usually a non-legally binding partnership. There is no concrete goal in this aspect that can be accomplished by the coach and for this reason that there can be no cause for legal effects for those that are unreached but desired. This agreement is primarily designed to create and develop strategies through collaboration by the parties where the coach supports the client in establishing proper behavior in every challenge.This Coaching Contract PDF Template is a quick PDF instrument that is instantly created as a downloadable and printable file after submission from the form that it comes with. This template is easy to modify to your desired layout. The options and features available on the PDF editor are easy to use. Modify the contents laying out the design in a WYSIWYG manner. Information submitted through the form is stored in a database and can be reused. A design change on the template after a download of the document? No problem! Just edit the content and download again the PDF and you have the information in a new layout. Take advantage of the tools and features that Jotform offers. Use this Coaching Contract PDF template here in Jotform!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: helperClass().textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                    )
                        ]),
                      ),
                    ),
                    selecteValue == 1
                        ? Positioned(
                            bottom: height * 0.033,
                            left: width * 0.26,
                            right: width * 0.26,
                            child: Container(
                                alignment: Alignment.center,
                                width: 140,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: helperClass().fillColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selecteValue = 2;
                                    });
                                  },
                                  child: Text(
                                    'VERIFY',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                )))
                        : selecteValue == 2
                            ? Positioned(
                                bottom: height * 0.040,
                                left: width * 0.26,
                                right: width * 0.26,
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 140.w,
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: helperClass().fillColor,
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selecteValue = 3;
                                        });
                                      },
                                      child: Text(
                                        'AGREE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    )))
                            : Positioned(
                                bottom: height * 0.040,
                                left: width * 0.26,
                                right: width * 0.26,
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 140.w,
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: helperClass().fillColor,
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/main_driver');
                                      },
                                      child: Text(
                                        'AGREE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  SingleChildScrollView vehicleDetail(double height, double width) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: 800.h, maxHeight: 1600.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: vehicleDetails.length,
            itemBuilder: (context, index) {
              var item = vehicleDetails[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: width * 0.8,
                            child: (index == 1 || index == 2)
                                ? DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: index == 1
                                          ? dropdownValue1
                                          : dropdownValue2,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 30.sp,
                                      ),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.sp),
                                      iconSize: 0,
                                      elevation: 16,
                                      isDense: true,
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          index == 1
                                              ? dropdownValue1 = newValue!
                                              : dropdownValue2 = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        index == 1 ? 'Select seats' : 'Select',
                                        'Two',
                                        'Three',
                                        'Four'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : TextField(
                                    decoration: InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.black),
                                        hintText: '${item['value']}'),
                                  ),
                          )
                        ],
                      ),
                    ),
                    (index == 1 || index == 2)
                        ? SizedBox()
                        : (index == 5 || index == 8 || index == 11)
                            ? Icon(
                                Icons.upload,
                                size: 20.sp,
                              )
                            : SizedBox()
                  ],
                ),
              );
            }),
      ),
    );
  }
}
