import 'package:com.roy93group.flutter_tutorial/lib/common/const/dimen_constants.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/button/flutter_speed_dial/flutter_speed_dial_screen.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/button/like_button_screen.dart';
import 'package:com.roy93group.flutter_tutorial/sample/widget/button/progress_state_button/progress_state_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'back_button_screen.dart';
import 'button_bar_screen.dart';
import 'drop_down_screen.dart';
import 'icon_button_screen.dart';
import 'outline_button_screen.dart';
import 'popup_menu_button_screen.dart';
import 'raw_material_button_screen.dart';
import 'text_button_screen.dart';
import 'toggle_button_screen.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class MenuButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "MenuButtonScreen",
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
              "FlutterSpeedDialScreen",
              () {
                Get.to(FlutterSpeedDialScreen());
              },
            ),
            UIUtils.getButton(
              "ProgressStateScreen",
              () {
                Get.to(ProgressStateScreen());
              },
            ),
            UIUtils.getButton(
              "BackButtonScreen",
              () {
                Get.to(BackButtonScreen());
              },
            ),
            UIUtils.getButton(
              "ButtonBarScreen",
              () {
                Get.to(ButtonBarScreen());
              },
            ),
            UIUtils.getButton(
              "DropDownScreen",
              () {
                Get.to(DropDownScreen());
              },
            ),
            UIUtils.getButton(
              "IconButtonScreen",
              () {
                Get.to(IconButtonScreen());
              },
            ),
            UIUtils.getButton(
              "LikeButtonScreen",
              () {
                Get.to(LikeButtonScreen());
              },
            ),
            UIUtils.getButton(
              "OutlineButtonScreen",
              () {
                Get.to(OutlineButtonScreen());
              },
            ),
            UIUtils.getButton(
              "PopupMenuButtonScreen",
              () {
                Get.to(PopupMenuButtonScreen());
              },
            ),
            UIUtils.getButton(
              "RawMaterialButtonScreen",
              () {
                Get.to(RawMaterialButtonScreen());
              },
            ),
            UIUtils.getButton(
              "TextButtonScreen +++",
              () {
                Get.to(TextButtonScreen());
              },
            ),
            UIUtils.getButton(
              "ToggleButtonScreen",
              () {
                Get.to(ToggleButtonScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
