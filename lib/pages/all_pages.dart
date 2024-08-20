import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/state/auth_state_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Settings'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).signOut();
              },
              child: const Text("Simple Logout"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).signOutThrowsException();
              },
              child: const Text('Log Out That Throws Exception'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(authStateProvider.notifier).signIn();
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
