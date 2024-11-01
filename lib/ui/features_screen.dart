import 'package:bloc_practice/main.dart';
import 'package:bloc_practice/resources/route_assets.dart';
import 'package:flutter/material.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                route.pushNamed(Routes.counterRoute);
              },
            ),
            10.0.h(),
            ListTile(
              title: const Text('Switch'),
              onTap: () {
                route.pushNamed(Routes.switchRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
