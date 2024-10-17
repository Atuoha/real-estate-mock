import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'components/bg_widget.dart';
import 'components/bottom_nav_widget.dart';
import 'components/custom_app_bar.dart';
import 'components/greeting_widget.dart';
import 'components/intro_text.dart';
import 'components/offer_widget.dart';
import 'components/property_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46.0),
        child: CustomAppBar(size: size),
      ),
      body: ContainerBG(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(120),
                      GreetingWidget(),
                      Gap(5),
                      IntroText(),
                      Gap(30),
                      OfferWidget(),
                    ],
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: PropertyListWidget(size: size),
                ),
              ],
            ),
            const Positioned(
              bottom: 20,
              left: 70,
              right: 70,
              child: BottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}
