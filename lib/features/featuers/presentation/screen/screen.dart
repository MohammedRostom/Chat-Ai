import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class chatscreen extends StatelessWidget {
  chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: Bodyofscreen(),
    );
  }
}
