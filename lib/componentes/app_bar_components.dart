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
        child: Padding(
          padding: const EdgeInsets.all(15),//Valor apenas pra não ficar torto, sei que os valores são left: 13.98, top: 17.48
          child: Icon(
            isSecondPage ? Icons.arrow_back : Icons.menu,
            color: AppColors.white,
          ),
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(15),//Valor apenas pra não ficar torto, sei que os valores são top:12.23 e left:314.56
        child: Icon(Icons.account_circle, color: AppColors.white),
        
      ),
    ],
    flexibleSpace: SafeArea(
      child: Column(
        children: [
          Image.asset(
            'assets_images/Group 119.png',
          width: 115,//tamanho indicado no figma
          height: 76.99,
          alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0),
            child: Text(
              "RICK AND MORTY API",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.5,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
                letterSpacing: 16.5 / 100,//tamanho indicado no figma
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
