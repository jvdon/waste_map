import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waste_map/partials/loading_widget.dart';

class LoadingPage extends StatefulWidget {
  final Widget target;
  final Duration delay;
  const LoadingPage({super.key, required this.target, this.delay = const Duration(seconds: 5)});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      widget.delay,
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.target));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
