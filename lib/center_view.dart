import 'package:flutter/material.dart';
import 'package:popup_window/screenUtil.dart';

enum CenterType {
  normal,
}

class CenterModel {
  final String title;
  final String text;
  final String left;
  final String right;
  final int rightColor;
  final CenterType type;

  CenterModel({
    this.type = CenterType.normal,
    this.title = '提示',
    this.text = '没有消息提示',
    this.left = '取消',
    this.right = '确认',
    this.rightColor = 0xFF3594F7,
  });
}

///中间弹框
class CenterView extends StatefulWidget {
  final CenterModel centerModel;
  CenterView(this.centerModel);
  _CenterView createState() => new _CenterView();
}

class _CenterView extends State<CenterView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        width: ScreenUtil.instance.setWidth(560),
        height: ScreenUtil.instance.setWidth(346),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil.instance.setWidth(10)),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(
                top: ScreenUtil.instance.setWidth(30),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: widget.centerModel.title,
                  style: new TextStyle(
                    color: Color(0xFF4E5463),
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil.instance.setSp(36),
                  ),
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.instance.setWidth(40)),
                child: new Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: widget.centerModel.text,
                      style: new TextStyle(
                        color: Color(0xFF4E5463),
                        fontSize: ScreenUtil.instance.setSp(28),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: _getCancelButton(),
                ),
                new Expanded(
                  flex: 1,
                  child: _getSureButton(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ///左边取消按钮
  Widget _getCancelButton() {
    return new GestureDetector(
      onTap: () {
        Navigator.pop(context, false);
      },
      child: new Container(
        height: ScreenUtil.instance.setWidth(100),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: widget.centerModel.left,
              style: new TextStyle(
                color: Color(0xFF666666),
                fontSize: ScreenUtil.instance.setSp(32),
              ),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Color(0xFFE5E5E5),
            width: ScreenUtil.instance.setWidth(1),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ScreenUtil.instance.setWidth(16)),
          ),
        ),
      ),
    );
  }

  ///右边确定按钮
  Widget _getSureButton() {
    return new GestureDetector(
      onTap: () {
        Navigator.pop(context, true);
      },
      child: new Container(
        height: ScreenUtil.instance.setWidth(100),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: widget.centerModel.right,
              style: new TextStyle(
                color: Color(widget.centerModel.rightColor),
                fontSize: ScreenUtil.instance.setSp(32),
              ),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Color(0xFFE5E5E5),
            width: ScreenUtil.instance.setWidth(1),
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(ScreenUtil.instance.setWidth(16)),
          ),
        ),
      ),
    );
  }
}
