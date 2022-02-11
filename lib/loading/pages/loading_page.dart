import 'package:flutter/material.dart';
import 'package:one_minute_bloc_tuto/utils/utils.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TestMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading page"),
      ),
      body: Center(
        child: Wrap(
          spacing: 12.0,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("I want to be testable !"),
            CircularProgressIndicator(value: isTesting ? 0 : null),
          ],
        ),
      ),
    );
  }
}
