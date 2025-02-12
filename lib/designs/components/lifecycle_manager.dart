import 'dart:developer';

import 'package:flutter/material.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  const LifeCycleManager({super.key, required this.child});

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  bool canOpen = false;
  bool isOpened = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        log('inactive...');
      case AppLifecycleState.detached:
        log('detached...');
      case AppLifecycleState.resumed:
        log('resume...');
      case AppLifecycleState.hidden:
        log('hidden...');
      default:
        log('default...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child);
  }
}
