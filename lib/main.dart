import 'package:cheat_chat/cheat_chat_class.dart';
import 'package:cheat_chat/constants/app_constants.dart';
import 'package:cheat_chat/model/local/secure.dart';
import 'package:cheat_chat/view_model/bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model/local/shared.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.getInstance().cacheInit();
  SecureStorage.getInstance().init();
  Constants.configLoading();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
        path: 'assets/translation',
        fallbackLocale: const Locale('en', 'US'),
        child: const CheatChatApp()
    ),
  );
}
