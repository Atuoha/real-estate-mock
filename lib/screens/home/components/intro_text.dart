import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_color.dart';

class IntroText extends StatefulWidget {
  const IntroText({super.key});

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(Duration.zero, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(_controller),
        child: Text(
          'let\'s select your perfect place',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 35,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
