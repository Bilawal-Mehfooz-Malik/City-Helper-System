import 'package:flutter/material.dart';

const kHomeKey = ValueKey('home');

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: kHomeKey);
  }
}
