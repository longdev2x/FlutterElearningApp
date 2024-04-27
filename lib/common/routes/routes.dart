import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/features/buy_course/view/buy_course.dart';
import 'package:ulearning_app/features/course_detail/view/course_detail.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/features/lesson_detail/view/lesson_detail.dart';
import 'package:ulearning_app/features/profile/courses_bought/view/courses_bought.dart';
import 'package:ulearning_app/features/profile/settings/view/settings.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/view/application.dart';
import 'package:ulearning_app/features/sign_in/view/sign_in.dart';
import 'package:ulearning_app/features/sign_up/view/sign_up.dart';
import 'package:ulearning_app/features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(
        path: AppRoutesNames.welcome,
        page: WelcomeScreen(),
      ),
      const RouteEntity(
        path: AppRoutesNames.register,
        page: SignUpScreen(),
      ),
      const RouteEntity(
        path: AppRoutesNames.signIn,
        page: SignInScreen(),
      ),
      const RouteEntity(
        path: AppRoutesNames.application,
        page: ApplicationScreen(),
      ),
      const RouteEntity(
        path: AppRoutesNames.home,
        page: HomeScreen(),
      ),
      const RouteEntity(
        path: AppRoutesNames.courseDetail,
        page: CourseDetail(),
      ),
      const RouteEntity(
          path: AppRoutesNames.lessonDetail, page: LessonDetail()),
      const RouteEntity(path: AppRoutesNames.buyCourse, page: BuyCourseScreen()),
      const RouteEntity(path: AppRoutesNames.settings, page: SettingsScreen()),
      const RouteEntity(path: AppRoutesNames.coursesBought, page: CoursesBought())
    ];
  }

  static MaterialPageRoute generateRoutSettings(RouteSettings settings) {
    // Global.storageService.removeKey(AppConstants.storageDeviceOpenFirstKey, 5);
    // Global.storageService.removeKey(AppConstants.storageUserTokenKey, 5);
    // Global.storageService.removeKey(AppConstants.storageUserProfileKey, 5);
    //print('Tokkennnn-   ${Global.storageService.getUserToken()}');
    var result =
        routes().where((element) => element.path == settings.name).toList();

    bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
    bool isLoggedIn = Global.storageService.isLoggedIn();

    if (result[0].path == AppRoutesNames.welcome && deviceFirstTime) {
      if (isLoggedIn) {
        return MaterialPageRoute(
            builder: (ctx) => const ApplicationScreen(), settings: settings);
      }
      return MaterialPageRoute(
          builder: (ctx) => const SignInScreen(), settings: settings);
    } else {
      return MaterialPageRoute(
          builder: (ctx) => result[0].page, settings: settings);
    }
  }
}

class RouteEntity {
  const RouteEntity({required this.path, required this.page});
  final String path;
  final Widget page;
}
