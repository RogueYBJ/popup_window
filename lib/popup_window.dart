library popup_window;

import 'package:flutter/material.dart';
import 'package:popup_window/screenUtil.dart';
import 'package:popup_window/center_view.dart';

void showScreen({
  //获取上下文
  BuildContext context,
  //默认适配器的宽
  double width = 750,
  //默认适配器的高
  double height = 1334,
  //默认适配字体大小
  bool isSp = true,
}) {
  ScreenUtil.instance =
      ScreenUtil(width: width, height: height, allowFontScaling: isSp)
        ..init(context);
}

///展示中间的弹框
void showCenter({
  //获取上下文
  BuildContext context,
  //返回方法
  Function action,
  //自定义centerView
  Widget centerView,
  //传入现有的弹框模型状态
  CenterType centerType = CenterType.normal,
  //传入文字及颜色配置
  CenterModel centerModel,
  //配置提示信息
  String text,
}) {
  if (ScreenUtil.isSetup == false) {
    showScreen(context: context);
  }
  showDialog(
    context: context,
    builder: (ctx) {
      return centerView != null
          ? centerView
          : new CenterView(centerModel != null
              ? centerModel
              : new CenterModel(text: text));
    },
  ).then((onValue) {
    if (action != null) action(onValue);
  });
}

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
