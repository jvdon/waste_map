import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatefulWidget {
  final Widget target;
  final Duration delay;
  const LoadingPage(
      {super.key,
      required this.target,
      this.delay = const Duration(seconds: 5)});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.delay,
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastEaseInToSlowEaseOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      widget.delay,
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => widget.target));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Icon(
            Icons.recycling,
            size: 64,
          ),
        ),
      ),
    );
  }
}
