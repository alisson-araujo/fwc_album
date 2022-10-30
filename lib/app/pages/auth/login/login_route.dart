import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/pages/auth/login/login_page.dart';
import 'package:fwc_album/app/services/login/login_service.dart';
import 'package:fwc_album/app/services/login/login_service_impl.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(authRepository: i()),
        ),
      ];

  @override
  WidgetBuilder get page => (context) => const LoginPage();
}
