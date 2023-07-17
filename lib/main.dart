import 'package:flutter/material.dart';
import 'package:degree/constants/routes.dart';
import 'package:degree/widgets/current_weather_card.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomeView(),
    routes: {
      homeRoute: (context) => const HomeView(),
    },
  ));
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
            ),
          ),
          const SafeArea(
            top: true,
            left: false,
            bottom: true,
            right: false,
            minimum: EdgeInsets.all(12.0),
            child: Column(
              children: [
                CurrentWeatherCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
