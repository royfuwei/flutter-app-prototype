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
          name: LoginSplashPage.routeName,
          page: () => LoginSplashPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: LocationOpenPage.routeName,
          page: () => LocationOpenPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: NotificationOpenPage.routeName,
          page: () => NotificationOpenPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ImageUploadPage.routeName,
          page: () => ImageUploadPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ImagePickerPage.routeName,
          page: () => ImagePickerPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: UserCreateInfoPage.routeName,
          page: () => UserCreateInfoPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: UserCreatePage.routeName,
          page: () => UserCreatePage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: CaptchaPage.routeName,
          page: () => CaptchaPage(),
          binding: AppPagesBind(),
        ),
        GetPage(
          name: ImagePickerPage.routeName,
          page: () => ImagePickerPage(),
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
          name: DatingAddPage.routeName,
          page: () => DatingAddPage(),
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
