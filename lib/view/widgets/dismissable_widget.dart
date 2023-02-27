import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kind/helper/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DismissableWidget extends StatefulWidget {
  const DismissableWidget(
      {Key? key,
      required this.index,
      required this.child,
      required this.item,
      required this.onDismissed})
      : super(key: key);
  final int index;
  final Widget child;
  final List item;
  final DismissDirectionCallback onDismissed;

  @override
  State<DismissableWidget> createState() => _DismissableWidgetState();
}

class _DismissableWidgetState extends State<DismissableWidget> {
  @override
  Widget build(BuildContext context) => Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(widget.item[widget.index]['username']),
        background: buildSwiperAciotnRight(),
        secondaryBackground: buildSwiperAciotnRight(),
        child: widget.child,
        onDismissed: widget.onDismissed,
      );

  buildSwiperAciotnRight() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 60.h,
          child: Container(
            padding: EdgeInsets.all(10.sp),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 255, 177, 177),
            ),
            child: Text(
              'Remove',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
