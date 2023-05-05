import 'package:flutter/material.dart';
import 'package:galary_flutter_application/presentation/widgets/photo_card_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: PhotoCardList(),
        ),
      ),
    );
  }
}