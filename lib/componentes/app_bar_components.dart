import 'package:app_rick_and_morty/pages/home_page.dart';
import 'package:app_rick_and_morty/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget appBarComponent(
  BuildContext context, {
  bool isSecondPage = false,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight * 2.2,
    backgroundColor: AppColors.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    leading: Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          final currrentRoute = ModalRoute.of(context)?.settings.name;
          if (currrentRoute == HomePage.routeId) return;
          Navigator.pop(context);
        },
        child: Icon(
          isSecondPage ? Icons.arrow_back : Icons.menu,
          color: AppColors.white,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(right: 16.0),
        child: Icon(Icons.person, color: AppColors.white),
      ),
    ],
    flexibleSpace: SafeArea(
      child: Column(
        children: [
          Image.asset('assets_images/Group 119.png'),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'RICK AND MORTY API',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
