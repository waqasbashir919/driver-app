import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List<_SalesData> data = [
    _SalesData('Mon', 986),
    _SalesData('Tue', 770),
    _SalesData('Wed', 935),
    _SalesData('Thu', 650),
    _SalesData('Fri', 990),
    _SalesData('Sat', 690),
    _SalesData('SUN', 890)
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.w;
    var height = MediaQuery.of(context).size.height.h;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                LayoutBuilder(builder: ((context, constraints) {
                  return SizedBox(
                    height: constraints.maxHeight / 0.9.h,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: SingleChildScrollView(
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
                                  'WALLET',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/inbox');
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
                            padding: EdgeInsets.all(10.sp),
                            child: Image(
                                image: AssetImage('assets/walletImage.png')),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 140.w,
                              padding: EdgeInsets.all(10.sp),
                              margin: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                  color: helperClass().fillColor,
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'WITHDRAWL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      letterSpacing: 1),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200,
                              ),
                              width: width * 0.9,
                              // height: height / 2,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                width: 100.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                    vertical: 10.h),
                                                margin: EdgeInsets.only(
                                                    left: 5.w,
                                                    right: 2.w,
                                                    top: 5.w,
                                                    bottom: 5.w),
                                                decoration: BoxDecoration(
                                                    color:
                                                        helperClass().fillColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.r)),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    'This week',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13.sp,
                                                        letterSpacing: 1),
                                                  ),
                                                )),
                                            Container(
                                                alignment: Alignment.center,
                                                width: 100.w,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 10.h,
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 5.w,
                                                    right: 2.w,
                                                    top: 5.w,
                                                    bottom: 5.w),
                                                decoration: BoxDecoration(
                                                    color: helperClass()
                                                        .fillColor
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.r)),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    'This month',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        letterSpacing: 1),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Text(
                                          '91,241\$',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SfCartesianChart(
                                        plotAreaBorderWidth: 0,
                                        primaryXAxis: CategoryAxis(),
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <
                                            ChartSeries<_SalesData, String>>[
                                          SplineSeries<_SalesData, String>(
                                              enableTooltip: true,
                                              dataSource: data,
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales,
                                              name: 'Sales',
                                              width: 4,
                                              selectionBehavior:
                                                  SelectionBehavior(
                                                      enable: true),
                                              color: Color.fromARGB(
                                                  255, 23, 107, 26),
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: false))
                                        ]),
                                  ],
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(bottom: 100.h),
                          )
                        ]),
                      ),
                    ),
                  );
                })),
                DraggableScrollableSheet(
                    initialChildSize: 0.13,
                    minChildSize: 0.13,
                    maxChildSize: height * 0.00048,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.r))),
                        child: ListView.builder(
                            controller: scrollController,
                            physics: ClampingScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        top: BorderSide(
                                            width: 2.w,
                                            color: Color.fromARGB(
                                                255, 245, 243, 243))),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 60.w,
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: 4.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Column(
                                  children: [
                                    draggableGroup(
                                        index: 1,
                                        height: height,
                                        width: width,
                                        prefixImg: 'assets/carImg.png',
                                        title: 'Hired',
                                        date: '01-12-2022',
                                        postfixImg: 'assets/greenDollarImg.png',
                                        price: '-124'),
                                    draggableGroup(
                                        index: 2,
                                        height: height,
                                        width: width,
                                        prefixImg: 'assets/greenDollarImg.png',
                                        title: 'Tipped',
                                        date: '5-Aug-2022',
                                        postfixImg: 'assets/greenDollarImg.png',
                                        price: '-43'),
                                    draggableGroup(
                                        index: 3,
                                        height: height,
                                        width: width,
                                        prefixImg: 'assets/carImg.png',
                                        title: 'Withdrawl',
                                        date: '29-May-2022',
                                        postfixImg: 'assets/redDollarImg.png',
                                        price: '-43')
                                  ],
                                );
                              }
                            }),
                      );
                    })
              ],
            )));
  }

  Container draggableGroup(
      {required int index,
      required double height,
      width,
      required String prefixImg,
      title,
      date,
      postfixImg,
      price}) {
    return Container(
        padding: EdgeInsets.all(10.sp),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: width * 0.15,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: helperClass().fillColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image(
                      image: AssetImage(prefixImg),
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: width * 0.17,
                height: height * 0.06,
                decoration: BoxDecoration(
                    color: index == 3
                        ? Color.fromARGB(255, 255, 189, 189)
                        : helperClass().fillColor,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(postfixImg)),
                    Text(price,
                        style: TextStyle(
                            color: index == 3
                                ? Colors.red
                                : helperClass().textColor,
                            fontSize: 16.sp)),
                  ],
                )),
          ],
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
