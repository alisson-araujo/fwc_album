import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';

abstract class LoginPresenter extends FwcPresenter {
  Future<void> login(String email, String password);
}
