enum AppPages {
  home(0),
  settings(1),
  login(2);

  final int value;
  const AppPages(this.value);
}

extension AppPagesX on int {
  AppPages get toAppPage {
    switch (this) {
      case 0:
        return AppPages.home;
      case 1:
        return AppPages.settings;
      case 2:
        return AppPages.login;
      default:
        return AppPages.home;
    }
  }
}

extension XPath on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.home:
        return '/';
      case AppPages.settings:
        return '/settings';
      case AppPages.login:
        return '/login';
      default:
        return '/';
    }
  }
}
