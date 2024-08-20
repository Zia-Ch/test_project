import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/enums/app_pages.dart';

final selectedPageProvider = StateProvider<AppPages>((ref) {
  return AppPages.home;
});
