import 'package:flutter/material.dart';

class IconsRow extends StatelessWidget {
  final String title1;
  final Widget icon1;
  final String title2;
  final Widget icon2;
  final double widthSizedBox;
  final Widget screen1;
  final Widget screen2;

  IconsRow(
      {this.title1,
      this.icon1,
      this.title2,
      this.icon2,
      this.widthSizedBox,
      this.screen1,
      this.screen2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen1,
              )),
          child: Column(
            children: [
              icon1,
              Text(
                title1,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              )
            ],
          ),
        ),
        SizedBox(
          width: widthSizedBox ?? 35.0,
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screen2,
              )),
          child: Column(
            children: [
              icon2,
              Text(
                title2,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
