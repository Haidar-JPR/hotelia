import 'package:flutter/material.dart';
import 'package:hotelio/src/config/app_assets.dart';
import 'package:hotelio/src/widgets/custom_button.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // NOTE: Background Screen
          Image.asset(
            AppAsset.background,
            fit: BoxFit.cover,
          ),

          // NOTE: Linear Gradient Shadow
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // NOTE: Text Content
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 55,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: Header
                Text(
                  'Your Great Life Starts Here',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                  softWrap: true,
                ),

                // NOTE: Sub Text
                Text(
                  'More than just a hotel',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                  softWrap: true,
                ),
                const SizedBox(height: 50),

                // NOTE: Get Started Button
                CustomButton(
                  name: 'Get Started',
                  press: () {},
                  width: 0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
