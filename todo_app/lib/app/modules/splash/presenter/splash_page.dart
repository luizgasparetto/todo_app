import 'package:flutter/material.dart';

import 'controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.controller}) : super(key: key);

  final SplashController controller;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.initApp();
    widget.controller.authStore.observer(onState: widget.controller.redirectUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
