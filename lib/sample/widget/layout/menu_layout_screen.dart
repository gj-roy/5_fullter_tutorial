import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.roy93group.flutter_tutorial/lib/common/const/DimenConstants.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/UIUtils.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/layout/custom_multi_child_layout/custom_multi_child_layout_screen.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/layout/layout_multiple_screen/layout_multiple_screen.dart';

import 'layout_builder_screen.dart';
import 'layout_single_screen.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class MenuLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "MenuLayoutScreen",
        () {
          Get.back();
        },
        null,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(DimenConstants.marginPaddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UIUtils.getButton(
              "CustomMultiChildLayoutScreen",
              () {
                Get.to(CustomMultiChildLayoutScreen());
              },
            ),
            UIUtils.getButton(
              "LayoutBuilderScreen",
              () {
                Get.to(LayoutBuilderScreen());
              },
            ),
            UIUtils.getButton(
              "LayoutMultipleScreen",
              () {
                Get.to(LayoutMultipleScreen());
              },
            ),
            UIUtils.getButton(
              "LayoutSingleScreen",
              () {
                Get.to(LayoutSingleScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
