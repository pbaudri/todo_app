import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors/colors.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: ColorConstants.white,
          ),
          Text(
            'TODO',
            style: TextStyle(
              color: ColorConstants.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.search_outlined,
            color: ColorConstants.white,
          ),
        ],
      ),
    );
  }
}
