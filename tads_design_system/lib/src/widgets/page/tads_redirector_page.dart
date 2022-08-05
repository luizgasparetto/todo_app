import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TADSRedirectorPage extends StatelessWidget {
  final Widget mobilePage;
  final Widget webPage;

  const TADSRedirectorPage({
    Key? key,
    required this.mobilePage,
    required this.webPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return kIsWeb && size.width > 1024 ? webPage : mobilePage;
  }
}
