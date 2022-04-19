import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_repository/global_repository.dart';
import 'package:logger_view/logger_view.dart';
import 'package:speed_share/app/controller/controller.dart';
import 'package:speed_share/pages/dialog/join_chat.dart';
import 'package:speed_share/utils/scan_util.dart';

import 'setting_page.dart';
import 'show_qr_page.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const SettingPage());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  'http://nightmare.fun/YanTool/image/hong.jpg',
                  width: 30.w,
                  height: 30.w,
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              '梦魇兽',
              style: TextStyle(
                fontSize: 16.w,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        Transform(
          transform: Matrix4.identity()..translate(12.w),
          child: Row(
            children: [
              NiIconButton(
                child: Icon(
                  Icons.info,
                  color: Colors.black,
                  size: 24.w,
                ),
                onTap: () async {
                  Get.to(Responsive(
                    builder: (context, screenType) {
                      return const Material(
                        child: SafeArea(
                          child: LoggerView(),
                        ),
                      );
                    },
                  ));
                },
              ),
              if (GetPlatform.isAndroid)
                NiIconButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 24.w,
                  ),
                  onTap: () async {
                    Get.dialog(const JoinChat());
                  },
                ),
              NiIconButton(
                child: SvgPicture.asset(
                  GlobalAssets.qrCode,
                  color: Colors.black,
                  width: 24.w,
                ),
                onTap: () async {
                  ScanUtil.parseScan();
                },
              ),
              NiIconButton(
                onTap: () {
                  Get.dialog(ShowQRPage(
                    port: controller.chatBindPort,
                  ));
                },
                child: Image.asset('assets/icon/qr.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
