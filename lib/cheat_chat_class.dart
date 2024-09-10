import 'package:cheat_chat/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helpers/data_types/permession_process_model.dart';
import 'helpers/helper_methods/handle_permissions.dart';
import 'model/local/shared.dart';

class CheatChatApp extends StatefulWidget {
  const CheatChatApp({super.key});

  @override
  State<CheatChatApp> createState() => _CheatChatAppState();
}

class _CheatChatAppState extends State<CheatChatApp> {

  @override
  void initState() {
    checkPermission(
      PermissionProcessModel(
        permissionClient: PermissionClient.notification,
        onPermissionGranted: () {},
        onPermissionDenied: () {},
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Cheat Chat',
        debugShowCheckedModeBanner: false,
        theme: CacheHelper.getInstance().shared.getBool('appTheme') == false
            ? ThemeData.light()
            : ThemeData.dark(),
        home: const Home(),
        builder: EasyLoading.init(),
      ),
    );
  }
}