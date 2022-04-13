import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_repository/global_repository.dart';
import 'package:speed_share/app/controller/controller.dart';
import 'package:speed_share/global/widget/pop_button.dart';
import 'package:speed_share/themes/theme.dart';

import 'widget/xliv-switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 16.w,
    );
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: OverlayStyle.dark,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          '全部设备',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: bold,
                fontSize: 18.w,
              ),
        ),
        leading: const PopButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GetBuilder<SettingController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '常规',
                    style: title,
                  ),
                ),
                SettingItem(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '下载路径',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      Text(
                        _.savePath,
                        style: TextStyle(
                          fontSize: 16.w,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .color
                              .withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SettingItem(
                  onTap: () {
                    controller.enableAutoChange(!controller.enableAutoDownload);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '自动下载',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      AquaSwitch(
                        value: controller.enableAutoDownload,
                        onChanged: controller.enableAutoChange,
                      ),
                    ],
                  ),
                ),
                SettingItem(
                  onTap: () {
                    controller.enableAutoChange(!controller.enableAutoDownload);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '剪切板共享',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      AquaSwitch(
                        value: controller.enableAutoDownload,
                        onChanged: controller.enableAutoChange,
                      ),
                    ],
                  ),
                ),
                SettingItem(
                  onTap: () {
                    controller.enableAutoChange(!controller.enableAutoDownload);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '收到消息时振动提醒',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      AquaSwitch(
                        value: controller.enableAutoDownload,
                        onChanged: controller.enableAutoChange,
                      ),
                    ],
                  ),
                ),
                // Text('隐私和安全'),
                // Text('消息和通知'),
                // Text('快捷键'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '关于速享',
                    style: title,
                  ),
                ),
                SettingItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '当前版本',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      Text(
                        'v2.0',
                        style: TextStyle(
                          fontSize: 20.w,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .color
                              .withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SettingItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '开源地址',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      Text(
                        'v2.0',
                        style: TextStyle(
                          fontSize: 20.w,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .color
                              .withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                SettingItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '其他版本下载',
                        style: TextStyle(
                          fontSize: 20.w,
                        ),
                      ),
                      Text(
                        'v2.0',
                        style: TextStyle(
                          fontSize: 20.w,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .color
                              .withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key key,
    this.child,
    this.onTap,
  }) : super(key: key);
  final Widget child;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: SizedBox(
        height: 64.w,
        child: Align(
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}

class AquaSwitch extends StatelessWidget {
  final bool value;

  final ValueChanged<bool> onChanged;

  final Color activeColor;

  final Color unActiveColor;

  final Color thumbColor;

  const AquaSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.unActiveColor,
    this.thumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.78,
      child: XlivSwitch(
        unActiveColor: unActiveColor ?? Theme.of(context).colorScheme.surface4,
        activeColor: Theme.of(context).primaryColor ?? activeColor,
        thumbColor: thumbColor,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
