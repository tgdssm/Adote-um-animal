import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    Key key,
    this.screen1,
    this.screen2,
    this.screen3,
  }) : super(key: key);
  Widget screen1;
  Widget screen2;
  Widget screen3;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Icon(
              Icons.home_filled,
              size: 35,
            ),
            onTap: () => screen1 != null? Get.to(screen1): null,
          ),
          GestureDetector(
            child: ImageIcon(
              AssetImage('assets/icons/add.png'),
              size: 45,
            ),
            onTap: () =>  screen2 != null? Get.to(screen2): null,
          ),
          GestureDetector(
            child: ImageIcon(
              AssetImage('assets/icons/person.png'),
              size: 45,
            ),
            onTap: () => screen3 != null? Get.to(screen3): null,
          )
        ],
      ),
    );
  }
}