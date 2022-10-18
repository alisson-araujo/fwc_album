import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/theme/theme_config.dart';
import 'package:fwc_album/app/pages/auth/login/login_page.dart';
import 'package:fwc_album/app/pages/home/home_page.dart';
import 'package:fwc_album/app/pages/splash/splash_route.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa World cup album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (_) => const SplashRoute(),
        '/auth/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage()
      },
    );
  }
}
