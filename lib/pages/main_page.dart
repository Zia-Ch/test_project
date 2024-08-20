import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/enums/app_pages.dart';
import 'package:testproject/state/selected_page_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({required this.body, super.key});
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(selectedPageProvider);
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          final page = value.toAppPage;
          ref.read(selectedPageProvider.notifier).state = page;
          context.go(page.toPath);
        },
        selectedIndex: page.index,
        destinations: destinations,
      ),
    );
  }
}

List<NavigationDestination> destinations = const [
  NavigationDestination(icon: Icon(Icons.home), label: "Home"),
  NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
];
