library flutterslidetoact;

import 'dart:math';

import 'package:flutter/material.dart';

import 'text_shimmer.dart';

/// Slider call to action component
class SlideAction extends StatefulWidget {
  /// The size of the sliding icon
  final double sliderButtonIconSize;

  /// Tha padding of the sliding icon
  final double sliderButtonIconPadding;

  /// The offset on the y axis of the slider icon
  final double sliderButtonYOffset;

  /// If the slider icon rotates
  final bool sliderRotate;

  /// The child that is rendered instead of the default Text widget
  final Widget? child;

  /// The height of the component
  final double height;

  final double width;

  /// The color of the inner circular button, of the tick icon of the text.
  /// If not set, this attribute defaults to primaryIconTheme.
  final Color? innerColor;

  /// The color of the external area and of the arrow icon.
  /// If not set, this attribute defaults to accentColor from your theme.
  final Color? outerColor;

  /// The text showed in the default Text widget
  final Widget? text;

  /// Text style which is applied on the Text widget.
  ///
  /// By default, the text is colored using [innerColor].
  final TextStyle? textStyle;

  /// The borderRadius of the sliding icon and of the background
  final double borderRadius;

  /// Callback called on submit
  /// If this is null the component will not animate to complete
  final VoidCallback? onSubmit;

  /// Elevation of the component
  final double elevation;

  /// The widget to render instead of the default icon
  final Widget? sliderButtonIcon;

  /// The widget to render instead of the default submitted icon
  final Widget? submittedIcon;

  /// The duration of the animations
  final Duration animationDuration;

  /// If true the widget will be reversed
  final bool reversed;

  /// the alignment of the widget once it's submitted
  final Alignment alignment;

  /// Create a new instance of the widget
  const SlideAction({
    Key? key,
    this.sliderButtonIconSize = 24,
    this.sliderButtonIconPadding = 16,
    this.sliderButtonYOffset = 0,
    this.sliderRotate = true,
    this.height = 70,
    this.width = 200,
    this.outerColor,
    this.borderRadius = 52,
    this.elevation = 6,
    this.animationDuration = const Duration(milliseconds: 300),
    this.reversed = false,
    this.alignment = Alignment.center,
    this.submittedIcon,
    this.onSubmit,
    this.child,
    this.innerColor,
    this.text,
    this.textStyle,
    this.sliderButtonIcon,
  }) : super(key: key);

  @override
  SlideActionState createState() => SlideActionState();
}

List<Color> listGradient1 = [
  Color(0xffDA4ECB),
  Color(0xff2C3AE8),
  Color(0xff467FC9),
];
List<Color> listGradient2 = [
  Color(0xff5E4F5C),
  Color(0xff505273),
  Color(0xff424A54),
];
bool complated = false;

/// Use a GlobalKey to access the state. This is the only way to call [SlideActionState.reset]
class SlideActionState extends State<SlideAction>
    with TickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _sliderKey = GlobalKey();
  double _dx = 0;
  double _maxDx = 0;
  double get _progress => _dx == 0 ? 0 : _dx / _maxDx;
  double _endDx = 0;
  double _dz = 1;
  double? _initialContainerWidth, _containerWidth;
  double _checkAnimationDx = 0;
  bool submitted = false;
  late AnimationController _checkAnimationController,
      _shrinkAnimationController,
      _resizeAnimationController,
      _cancelAnimationController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(widget.reversed ? pi : 0),
        child: Container(
          key: _containerKey,
          height: widget.height,
          width: widget.width,
          // constraints: _containerWidth != null
          //     ? null
          //     : BoxConstraints.expand(height: widget.height),
          child: Material(
            elevation: widget.elevation,
            color: widget.outerColor ?? Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gradient: LinearGradient(
                    colors: complated ? listGradient2 : listGradient1),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: widget.height,
                        height: widget.height,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff4954F5).withOpacity(.8),
                              blurRadius: 74,
                            ),
                          ],
                        ),
                        child: const SizedBox.shrink(),
                      ),
                      Container(
                        width: widget.height,
                        height: widget.height,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffEA4735).withOpacity(.8),
                              blurRadius: 74,
                            ),
                          ],
                        ),
                        child: const SizedBox.shrink(),
                      )
                    ],
                  ),
                  Opacity(
                    opacity: 1 - 1 * _progress,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(widget.reversed ? pi : 0),
                      child: widget.child ??
                          Container(
                            padding: const EdgeInsets.only(left: 80, right: 10),
                            // alignment: widget.alignLabel,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.white.withOpacity(.1),
                                  child: widget.text ?? Text(''),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                    ),
                  ),
                  Positioned(
                    left: widget.sliderButtonYOffset,
                    child: Transform.scale(
                      scale: _dz,
                      origin: Offset(_dx, 0),
                      child: Transform.translate(
                        offset: Offset(_dx, 0),
                        child: Container(
                          key: _sliderKey,
                          child: GestureDetector(
                            onHorizontalDragUpdate: onHorizontalDragUpdate,
                            onHorizontalDragEnd: (details) {
                              setState(() {
                                complated = true;
                              });
                              widget.onSubmit!();
                              // _endDx = _dx;
                              // if (_progress <= 0.8 || widget.onSubmit == null) {
                              //   _cancelAnimation();
                              // } else {
                              //   // await _resizeAnimation();

                              //   // await _shrinkAnimation();

                              //   // await _checkAnimation();

                              // }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Material(
                                borderRadius:
                                    BorderRadius.circular(widget.borderRadius),
                                color: widget.innerColor ??
                                    Theme.of(context).primaryIconTheme.color,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  height: widget.height - 8,
                                  width: widget.height - 8,
                                  decoration: BoxDecoration(
                                    color: complated
                                        ? const Color(0xff161617)
                                        : const Color(0xff957AF7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Transform.rotate(
                                    angle: widget.sliderRotate
                                        ? -pi * _progress
                                        : 0,
                                    child:
                                        Image.asset('assets/icons/slider.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dx = (_dx + details.delta.dx).clamp(0.0, _maxDx);
    });
  }

  /// Call this method to revert the animations
  Future reset() async {
    await _checkAnimationController.reverse().orCancel;

    submitted = false;

    await _shrinkAnimationController.reverse().orCancel;

    await _resizeAnimationController.reverse().orCancel;

    await _cancelAnimation();
    setState(() {
      complated = false;
    });
  }

  Future _checkAnimation() async {
    _checkAnimationController.reset();

    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _checkAnimationController,
      curve: Curves.slowMiddle,
    ));

    animation.addListener(() {
      if (mounted) {
        setState(() {
          _checkAnimationDx = animation.value;
        });
      }
    });
    await _checkAnimationController.forward().orCancel;
  }

  Future _shrinkAnimation() async {
    _shrinkAnimationController.reset();

    final diff = _initialContainerWidth! - widget.height;
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _shrinkAnimationController,
      curve: Curves.easeOutCirc,
    ));

    animation.addListener(() {
      if (mounted) {
        setState(() {
          _containerWidth = _initialContainerWidth! - (diff * animation.value);
        });
      }
    });

    setState(() {
      submitted = true;
    });
    await _shrinkAnimationController.forward().orCancel;
  }

  Future _resizeAnimation() async {
    _resizeAnimationController.reset();

    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _resizeAnimationController,
      curve: Curves.easeInBack,
    ));

    animation.addListener(() {
      if (mounted) {
        setState(() {
          _dz = 1 - animation.value;
        });
      }
    });
    await _resizeAnimationController.forward().orCancel;
  }

  Future _cancelAnimation() async {
    _cancelAnimationController.reset();
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _cancelAnimationController,
      curve: Curves.fastOutSlowIn,
    ));

    animation.addListener(() {
      if (mounted) {
        setState(() {
          _dx = (_endDx - (_endDx * animation.value));
        });
      }
    });
    _cancelAnimationController.forward().orCancel;
  }

  @override
  void initState() {
    super.initState();

    _cancelAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _checkAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _shrinkAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _resizeAnimationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox containerBox =
          _containerKey.currentContext!.findRenderObject() as RenderBox;
      _containerWidth = containerBox.size.width;
      _initialContainerWidth = _containerWidth;

      final RenderBox sliderBox =
          _sliderKey.currentContext!.findRenderObject() as RenderBox;
      final sliderWidth = sliderBox.size.width;

      _maxDx = _containerWidth! -
          (sliderWidth / 2) -
          40 -
          widget.sliderButtonYOffset;
    });
  }

  @override
  void dispose() {
    _cancelAnimationController.dispose();
    _checkAnimationController.dispose();
    _shrinkAnimationController.dispose();
    _resizeAnimationController.dispose();
    super.dispose();
  }
}
