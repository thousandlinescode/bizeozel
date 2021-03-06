import 'package:bizeozel/core/components/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:kartal/kartal.dart';

Widget loadingAnimation() {
  return Center(
    child: LoadingBouncingGrid.circle(
      backgroundColor: ColorPallette.color4,
    ),
  );
}

Widget postCardHeaderRow(
    BuildContext context, AsyncSnapshot snapshot, int index, first, second) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        constraints: BoxConstraints(
          maxWidth: context.width * 0.5,
        ),
        child: Text(
          '  ' + first.toString(),
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: TextStyle(
              fontSize: context.height * 0.024,
              fontWeight: FontWeight.bold,
              color: ColorPallette.color4),
        ),
      ),
      Text(
        second,
        style: TextStyle(
            fontSize: context.height * 0.02,
            fontWeight: FontWeight.bold,
            color: ColorPallette.color4.withOpacity(0.5)),
      ),
    ],
  );
}

Widget postCardBodyArea(
    BuildContext context, AsyncSnapshot snapshot, int index, height, widget) {
  return Container(
    height: context.height * height,
    decoration: BoxDecoration(
        color: ColorPallette.color3,
        borderRadius: context.normalBorderRadius,
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
    child: widget,
  );
}

Widget appBarHeader(BuildContext context, text, size, color, bool backbutton) {
  return Row(
    children: [
      context.emptySizedWidthBoxLow3x,
      backbutton
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30))
          : SizedBox(),
      Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
    ],
  );
}

Widget customAppBarHeaderIcon(
    BuildContext context, navigate, assetName, size, color) {
  return Padding(
    padding: context.horizontalPaddingLow,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
            onTap: () {
              navigate != null
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navigate))
                  : null;
            },
            child: color != null
                ? Image.asset(
                    'assets/icons/$assetName',
                    height: context.height * size,
                    width: context.height * size,
                    fit: BoxFit.cover,
                    color: color,
                  )
                : Image.asset(
                    'assets/icons/$assetName',
                    height: context.height * size,
                    width: context.height * size,
                    fit: BoxFit.cover,
                  )),
      ],
    ),
  );
}

Widget customAppBarBody(BuildContext context, navigate, iconName, text, color,
    iconSize, bool backbutton) {
  return Container(
    width: context.width,
    height: context.height * 0.4,
    decoration: BoxDecoration(
        color: ColorPallette.color4,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        context.emptySizedHeightBoxNormal,
        customAppBarHeaderIcon(context, navigate, iconName, iconSize, color),
        context.emptySizedHeightBoxLow,
        context.emptySizedHeightBoxLow,
        appBarHeader(context, text, 24.0, Colors.white, backbutton),
      ],
    ),
  );
}

Widget customAppBarArea(BuildContext context, widget) {
  return Container(
    height: context.height * 0.4,
    child: Stack(
      children: [
        widget,
        customAppBarBehindCircle(context, 0.04, -50.0),
        customAppBarBehindCircle(context, 0.1, 70.0),
      ],
    ),
  );
}

Positioned customAppBarBehindCircle(BuildContext context, bottom, right) {
  return Positioned(
    bottom: -context.height * bottom,
    right: right,
    child: Container(
      width: context.height * 0.22,
      height: context.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.height * 0.1)),
    ),
  );
}
