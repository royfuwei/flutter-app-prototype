import 'package:flutter/material.dart';

class DefaultPageRoute extends PageRouteBuilder {
  final Widget widget;
  DefaultPageRoute(
    this.widget,
  ) : super(
          //設定動畫持續的時間，建議再1和2之間
          transitionDuration: Duration(
            seconds: 1,
          ),
          //頁面的構造器
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          //過度效果
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              // 過度的動畫的值
              FadeTransition(
            // 過度的透明的效果
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
              // 給他個透明度的動畫   CurvedAnimation：設定動畫曲線
            ).animate(
              CurvedAnimation(
                //父級動畫
                parent: animation,
                //動畫曲線
                curve: Curves.ease,
              ),
            ),
            child: child,
          ),
        );
}
