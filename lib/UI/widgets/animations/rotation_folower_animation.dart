import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FollowerDistorion { none, light, heavy }

enum FollowBehavior { reverse, normal }

class RotatorFollower extends StatefulWidget {
  const RotatorFollower({
    required this.child,
    super.key,
  });

  final Widget child;
  @override
  State<RotatorFollower> createState() => _RotatorFollowerState();
}

class _RotatorFollowerState extends State<RotatorFollower> {
  double _mouseX = 0;
  double _mouseY = 0;
  double _screenWidth = 0;
  double _screenHeight = 0;
  bool _isMouseInside = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _screenWidth = MediaQuery.of(context).size.width;
        _screenHeight = MediaQuery.of(context).size.height;
      });
    });
    super.initState();
  }

  void _updateMousePosition(final PointerEvent details) {
    setState(() {
      if (details is PointerExitEvent) {
        _mouseX = 0;
        _mouseY = 0;
        _isMouseInside = false;
      } else {
        _mouseX = details.position.dx - (_screenWidth / 2);
        _mouseY = details.position.dy - (_screenHeight / 2);
        _isMouseInside = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildMouseRegionWrapper(
      _buildTransformWrapper(widget.child),
    );
  }

  Widget _buildMouseRegionWrapper(final Widget child) {
    return MouseRegion(
      onEnter: _updateMousePosition,
      onExit: _updateMousePosition,
      onHover: _updateMousePosition,
      child: child,
    );
  }

  Widget _buildTransformWrapper(final Widget child) {
    final double heightMultiplier = _mouseY / _screenHeight * .3;
    final double widthMultiplier = _mouseX / _screenWidth * .5;

    Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.005)
      ..rotateX(1 * heightMultiplier)
      ..rotateY(1 * widthMultiplier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: Matrix4.identity()..scale(_isMouseInside ? 1.1 : 1.0),
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: child,
      ),
    );
  }
}
