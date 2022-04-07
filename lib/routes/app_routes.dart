part of 'app_pages.dart';

abstract class AppRoutes {
  static List<GetPage<dynamic>> entryRoutes = [
    GetPage(
      name: EntryPage.routeName,
      page: () => EntryPage(),
      binding: AppPagesBind(),
      children: [
        GetPage(
          name: SplashPage.routeName,
          page: () => SplashPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: LoginPage.routeName,
          page: () => LoginPage(),
          binding: AppPagesBind(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: LoginTelPage.routeName,
          page: () => LoginTelPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: SignUpAccountPage.routeName,
          page: () => SignUpAccountPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: SignUpLocationPage.routeName,
          page: () => SignUpLocationPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: SignUpPushNotificationPage.routeName,
          page: () => SignUpPushNotificationPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: SignUpImagesUpload.routeName,
          page: () => SignUpImagesUpload(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ImageUploadPage.routeName,
          page: () => ImageUploadPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: UserCreateInfoPage.routeName,
          page: () => UserCreateInfoPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: SignUpUserInfoPage.routeName,
          page: () => SignUpUserInfoPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: LoginTelCaptchaPage.routeName,
          page: () => LoginTelCaptchaPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: UserCreateInfoPage.routeName,
          page: () => UserCreateInfoPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: LoginPage.routeName,
          page: () => LoginPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ForgotPasswordPage.routeName,
          page: () => ForgotPasswordPage(),
          binding: AppPagesBind(),
        ),
      ],
    ),
  ];
  static List<GetPage<dynamic>> mainRoutes = [
    GetPage(
      name: MainPage.routeName,
      page: () => MainPage(),
      binding: AppPagesBind(),
      children: [
        GetPage(
          name: HomePage.routeName,
          page: () => HomePage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: NotificationPage.routeName,
          page: () => NotificationPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ChatListPage.routeName,
          page: () => ChatListPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ChatPage.routeName,
          page: () => ChatPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: DatingAddImagesPage.routeName,
          page: () => DatingAddImagesPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: DatingAddInfoPage.routeName,
          page: () => DatingAddInfoPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: MorePage.routeName,
          page: () => MorePage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ImageUploadNotifyPage.routeName,
          page: () => ImageUploadNotifyPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: DatingInfoPage.routeName,
          page: () => DatingInfoPage(),
          binding: AppPagesBind(),
        ),
      ],
    ),
  ];
  // static const FirstPage = "/FirstPage";
}
