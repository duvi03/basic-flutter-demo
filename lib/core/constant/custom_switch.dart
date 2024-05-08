import 'package:flutter_learning_demo/core/z_file_core.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(begin: widget.value ? Alignment.centerRight : Alignment.centerLeft, end: widget.value ? Alignment.centerLeft : Alignment.centerRight).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: 34.sp,
            height: 18.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft ? Colors.orange : Colors.grey.shade700,
            ),
            child: Padding(
              padding: EdgeInsets.all(2.sp),
              child: Container(
                alignment: widget.value ? ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft) : ((Directionality.of(context) == TextDirection.rtl) ? Alignment.centerLeft : Alignment.centerRight),
                child: Container(
                  width: 16.sp,
                  height: 16.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
