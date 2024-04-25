import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildGridListItems extends StatelessWidget {
  final Color backgroundColor;
  final IconData iconData;
  final String headTitle;
  final String subTitle;
  final Function()? onTap;

  const BuildGridListItems({
    super.key,
    required this.backgroundColor,
    required this.iconData,
    required this.headTitle,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              headTitle,
              style: GoogleFonts.peralta(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              style: GoogleFonts.peralta(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
