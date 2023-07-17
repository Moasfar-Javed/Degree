import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CurrentWeatherCard extends StatefulWidget {
  const CurrentWeatherCard({super.key});

  @override
  State<CurrentWeatherCard> createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: GlassContainer(
          width: screenWidth * 0.95,
          height: screenHeight * 0.2,
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.45),
              Colors.white.withOpacity(0.15)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.30),
              Colors.white.withOpacity(0.10),
              Colors.white.withOpacity(0.10),
              Colors.white.withOpacity(0.00),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.39, 0.40, 1.0],
          ),
          blur: 30.0,
          borderWidth: 1.5,
          elevation: 6.0,
          isFrostedGlass: false,
          shadowColor: Colors.black.withOpacity(0.20),
          //frostedOpacity: 0.12,
          borderRadius: BorderRadius.circular(20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    '24°',
                    style: TextStyle(fontSize: 40),
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ttb,
                    colors: [
                      Colors.white,
                      Color(0x4DFFFFF),
                    ],
                  ),
                  Text('H: 29  L: 19'),
                  Text('Thunderstorms'),
                ],
              ),
              SizedBox(width: screenWidth * 0.1),
              Image.asset(
                'assets/images/heavyrain_storm.png',
                height: screenHeight * 0.2,
                width: screenHeight * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
