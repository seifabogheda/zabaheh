import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

enum ButtonState { Busy, Idle }

class CustomButtonAnimation extends StatefulWidget {
  final double height;
  final double width;
  final double minWidth;
  final Widget loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function onTap;
  final Color color;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final double elevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double disabledElevation;
  final Color disabledColor;
  final Color disabledTextColor;

  const CustomButtonAnimation(
      {@required this.height,
        @required this.width,
        this.minWidth: 0,
        this.loader,
        this.animationDuration: const Duration(milliseconds: 450),
        this.curve: Curves.easeInOutCirc,
        this.reverseCurve: Curves.easeInOutCirc,
        @required this.child,
        this.onTap,
        this.color,
        this.focusColor,
        this.hoverColor,
        this.highlightColor,
        this.splashColor,
        this.colorBrightness,
        this.elevation,
        this.focusElevation,
        this.hoverElevation,
        this.highlightElevation,
        this.padding: const EdgeInsets.all(0),
        this.borderRadius: 0.0,
        this.clipBehavior: Clip.none,
        this.focusNode,
        this.materialTapTargetSize,
        this.roundLoadingShape: true,
        this.borderSide: const BorderSide(color: Colors.transparent, width: 0),
        this.disabledElevation,
        this.disabledColor,
        this.disabledTextColor,
        Key key,
      }):assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
        assert(clipBehavior != null),super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButtonAnimation>
    with TickerProviderStateMixin {
  double loaderWidth;

  Animation<double> _animation;
  AnimationController _controller;
  ButtonState btn = ButtonState.Idle;

  // GlobalKey _buttonKey = GlobalKey();
  double _minWidth = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ButtonState.Idle;
        });
      }
    });

    minWidth = widget.height;
    loaderWidth = widget.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ButtonState.Busy;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  lerpWidth(a, b, t) {
    if (a == 0.0 || b == 0.0) {
      return null;
    } else {
      return a + (b - a) * t;
    }
  }

  get minWidth => _minWidth;
  set minWidth(double w) {
    if (widget.minWidth == 0) {
      _minWidth = w;
    } else {
      _minWidth = widget.minWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return buttonBody();
      },
    );
  }

  Widget buttonBody() {
    return Container(
      height: widget.height,
      width: lerpWidth(widget.width, minWidth, _animation.value),
      child: ButtonTheme(
        height: widget.height,
        shape: RoundedRectangleBorder(
          side: widget.borderSide,
          borderRadius: BorderRadius.circular(widget.roundLoadingShape
              ? lerpDouble(
              widget.borderRadius, widget.height / 2, _animation.value)
              : widget.borderRadius),
        ),
        child: RaisedButton(
            // key: _buttonKey,
            color: widget.color,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            colorBrightness: widget.colorBrightness,
            elevation: widget.elevation,
            focusElevation: widget.focusElevation,
            hoverElevation: widget.hoverElevation,
            highlightElevation: widget.highlightElevation,
            padding: widget.padding,
            clipBehavior: widget.clipBehavior,
            focusNode: widget.focusNode,
            materialTapTargetSize: widget.materialTapTargetSize,
            disabledElevation: widget.disabledElevation,
            disabledColor: widget.disabledColor,
            disabledTextColor: widget.disabledTextColor,
            onPressed: widget.onTap,
            child: btn == ButtonState.Idle ? widget.child : widget.loader),
      ),
    );
  }
}