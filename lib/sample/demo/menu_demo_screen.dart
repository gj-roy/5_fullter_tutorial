import 'package:com.roy93group.flutter_tutorial/lib/common/const/DimenConstants.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/UIUtils.dart';
import 'package:com.roy93group.flutter_tutorial/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'advance_pdf_viewer/advance_pdf_viewer_screen.dart';
import 'async/menu_async_screen.dart';
import 'battery_plus/battery_plus_screen.dart';
import 'communication_between_widget/communication_between_widget_screen.dart';
import 'connectivity_plus/connectivity_plus_screen.dart';
import 'counter/counter_screen.dart';
import 'crypto/crypto_screen.dart';
import 'device_info_plus/device_info_plus_screen.dart';
import 'diacritic/diacritic_screen.dart';
import 'dio/dio_screen.dart';
import 'easy_debounce/easy_debounce_screen.dart';
import 'encypt/encrypt_screen.dart';
import 'event_bus/event_bus_screen.dart';
import 'flutter_bloc/menu_flutter_block_screen.dart';
import 'flutter_local_notifications/flutter_local_notifications_screen.dart';
import 'flutter_offline/flutter_offline_screen.dart';
import 'flutter_screen_lock/flutter_screen_lock_screen.dart';
import 'focus_detector/focus_detector_screen.dart';
import 'getx/get_x_screen.dart';
import 'html2md/html2md_screen.dart';
import 'image_gallery_saver/image_gallery_saver_screen.dart';
import 'inherited/menu_inherited_screen.dart';
import 'load_local_json/load_local_json_screen.dart';
import 'local_auth/local_auth_screen.dart';
import 'one_target_mobile_sdk/one_target_mobile_sdk_screen.dart';
import 'package_info_plus/package_info_plus_screen.dart';
import 'permission_handler/permission_handler_screen.dart';
import 'restart_app/restart_app_screen.dart';
import 'share_plus/share_plus_screen.dart';
import 'shop/shop_screen.dart';
import 'theme/theme_screen.dart';
import 'tiengviet/tiengviet_screen.dart';
import 'timeago/timeago_screen.dart';
import 'tip_calculator/tip_calculator_screen.dart';
import 'todo/screen/to_do_main_screen.dart';
import 'url_launcher/url_launcher_screen.dart';
import 'wakelock/wakelock_screen.dart';

/**
 * Created by Loitp on 05,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class MenuDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "Demo menu",
        () {
          Get.back();
        },
        null,
      ),
      body: ListView(
        padding: EdgeInsets.all(DimenConstants.marginPaddingMedium),
        physics: BouncingScrollPhysics(),
        children: [
          UIUtils.getButton(
            "AdvancePDFViewerScreen",
            () {
              Get.to(AdvancePDFViewerScreen());
            },
          ),
          UIUtils.getButton(
            "Async",
            () {
              Get.to(MenuAsyncScreen());
            },
          ),
          UIUtils.getButton(
            "battery_plus",
            () {
              Get.to(BatteryPlusScreen());
            },
          ),
          UIUtils.getButton(
            "CommunicationBetweenWidgetScreen",
            () {
              Get.to(CommunicationBetweenWidgetScreen());
            },
          ),
          UIUtils.getButton(
            "connectivity_plus",
            () {
              Get.to(ConnectivityPlusScreen());
            },
          ),
          UIUtils.getButton(
            "Counter",
            () {
              Get.to(CounterScreen());
            },
          ),
          UIUtils.getButton(
            "crypto",
            () {
              Get.to(CryptoScreen());
            },
          ),
          UIUtils.getButton(
            "device_info_plus",
            () {
              Get.to(DeviceInfoPlusScreen());
            },
          ),
          UIUtils.getButton(
            "diacritic",
            () {
              Get.to(DiacriticScreen());
            },
          ),
          UIUtils.getButton(
            "dio",
            () {
              Get.to(DioScreen());
            },
          ),
          UIUtils.getButton(
            "easy_debounce",
            () {
              Get.to(EasyDebounceScreen());
            },
          ),
          UIUtils.getButton(
            "encrypt",
            () {
              Get.to(EncryptScreen());
            },
          ),
          UIUtils.getButton(
            "event_bus",
            () {
              Get.to(EventBusScreen());
            },
          ),
          UIUtils.getButton(
            "flutter_bloc",
            () {
              Get.to(MenuFlutterBlockScreen());
            },
          ),
          UIUtils.getButton(
            "FlutterLocalNotificationScreen",
            () async {
              final NotificationAppLaunchDetails? notificationAppLaunchDetails =
                  await flutterLocalNotificationsPlugin
                      .getNotificationAppLaunchDetails();
              Get.to(
                  FlutterLocalNotificationScreen(notificationAppLaunchDetails));
            },
          ),
          UIUtils.getButton(
            "flutter_offline",
                () {
              Get.to(FlutterOfflineScreen());
            },
          ),
          UIUtils.getButton(
            "flutter_screen_lock",
            () {
              Get.to(FlutterScreenLockScreen());
            },
          ),
          UIUtils.getButton(
            "focus_detector",
            () {
              Get.to(FocusDetectorScreen());
            },
          ),
          UIUtils.getButton(
            "get",
            () {
              Get.to(GetXScreen());
            },
          ),
          UIUtils.getButton(
            "html2md",
            () {
              Get.to(Html2MdScreen());
            },
          ),
          UIUtils.getButton(
            "image_gallery_saver",
            () {
              Get.to(ImageGallerySaverScreen());
            },
          ),
          UIUtils.getButton(
            "Inherited",
            () {
              Get.to(MenuInheritedScreen());
            },
          ),
          UIUtils.getButton(
            "Load Local Json",
            () {
              Get.to(LoadLocalJsonScreen());
            },
          ),
          UIUtils.getButton(
            "local_auth",
            () {
              Get.to(LocalAuthScreen());
            },
          ),
          UIUtils.getButton(
            "one_target_mobile_sdk",
            () {
              Get.to(OneTargetMobileSDKScreen());
            },
          ),
          UIUtils.getButton(
            "package_info_plus",
            () {
              Get.to(PackageInforPlusScreen());
            },
          ),
          UIUtils.getButton(
            "permission_handler",
            () {
              Get.to(PermissionHandlerScreen());
            },
          ),
          UIUtils.getButton(
            "restart_app",
            () {
              Get.to(RestartAppScreen());
            },
          ),
          UIUtils.getButton(
            "share_plus",
            () {
              Get.to(SharePlusScreen());
            },
          ),
          UIUtils.getButton(
            "Shop",
            () {
              Get.to(ShopScreen());
            },
          ),
          UIUtils.getButton(
            "Theme",
            () {
              Get.to(ThemeScreen());
            },
          ),
          UIUtils.getButton(
            "tiengviet",
            () {
              Get.to(TiengVietScreen());
            },
          ),
          UIUtils.getButton(
            "timeago",
            () {
              Get.to(TimeAgoScreen());
            },
          ),
          UIUtils.getButton(
            "Tip calculator",
            () {
              Get.to(TipCalculatorScreen());
            },
          ),
          UIUtils.getButton(
            "ToDoMainScreen",
            () {
              Get.to(() => ToDoMainScreen());
            },
          ),
          UIUtils.getButton(
            "url_launcher",
            () {
              Get.to(UrlLauncherScreen());
            },
          ),
          UIUtils.getButton(
            "wakelock",
            () {
              Get.to(WakeLockScreen());
            },
          ),
        ],
      ),
    );
  }
}