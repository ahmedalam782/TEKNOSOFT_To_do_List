import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerListItems extends StatelessWidget {
  final IconData iconData;
  final String headTitle;
  final String subTitle;
  final Function()? onTap;

  const ContainerListItems({
    super.key,
    required this.iconData,
    required this.headTitle,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color(0xff2466CF).withOpacity(.8),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headTitle,
                style: GoogleFonts.peralta(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2466CF).withOpacity(.8),
                  ),
                ),
              ),
              Text(
                subTitle,
                style: GoogleFonts.peralta(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(.7),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
