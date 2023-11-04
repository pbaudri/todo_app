import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors/colors.dart';

class HomePageUserWelcomeWidget extends StatelessWidget {
  const HomePageUserWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            foregroundImage: NetworkImage(
              'https://images.saatchiart.com/saatchi/938321/art/6005221/5075013-HSC00001-7.jpg',
            ),
            radius: 28.0,
            backgroundColor: ColorConstants.darkGrey,
          ),
          SizedBox(height: 36.0),
          Text(
            'Hello, Jane.',
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 32.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Look like feel good. \nYou have 3 tasks to do today.',
            style: TextStyle(
              color: ColorConstants.lightGrey,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 44.0),
          Text(
            'Today : SEPTEMBER 12, 2017',
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
