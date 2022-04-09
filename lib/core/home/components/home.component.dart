import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildNoArrowRefreshIndicator(
  BuildContext context,
  RefreshIndicatorMode refreshState,
  double pulledExtent,
  double refreshTriggerPullDistance,
  double refreshIndicatorExtent,
) {
  const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: refreshState == RefreshIndicatorMode.drag
          ? Opacity(
              opacity: opacityCurve.transform(
                  min(pulledExtent / refreshTriggerPullDistance, 1.0)),
              child: Icon(
                CupertinoIcons.refresh,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.inactiveGray, context),
                size: 24.0,
              ),
            )
          : Opacity(
              opacity: opacityCurve
                  .transform(min(pulledExtent / refreshIndicatorExtent, 1.0)),
              child: const CupertinoActivityIndicator(radius: 14.0),
            ),
    ),
  );
}
