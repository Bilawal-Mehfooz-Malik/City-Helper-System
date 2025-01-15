import 'package:flutter/material.dart';

const kHomeScreenKey = Key('home-screen-key');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('home screen', key: kHomeScreenKey)),
    );
  }
}
