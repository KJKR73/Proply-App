import 'package:ethinicty_recognition_app/ui/sizing_information.dart';
import 'package:ethinicty_recognition_app/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
