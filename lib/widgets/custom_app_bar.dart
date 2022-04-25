import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatefulWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  set value(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      // color: Colors.white
      //     .withOpacity((widget.scrollOffset / 350).clamp(0, 1).toDouble()),
      color: Colors.white,

      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Iconsax.menu,
              color: Colors.black,
              size: 30,
            ),
            Text(
              'SHABABEEK شبابيك.',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
