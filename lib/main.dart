import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/global.dart';

void main() async {
  await Global.init();
  HttpUtil().post('api/login');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        title: 'Uleaning App',
        theme: AppTheme.appThemeData,
        // Middleware onGenerateRoute sẽ gọi hàm Callback khi nào ta dùng pushNamed
        onGenerateRoute: (settings) {
          return AppPages.generateRoutSettings(settings);
        },
        //initialRoute: '/',
        //routes: routesMap,
        //home: WelcomeScreen(), //Initial route, use pushName , done use it more
      ),
    );
  }
}

