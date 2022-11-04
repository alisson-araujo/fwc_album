import 'package:fwc_album/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserModel();
  Future<void> logout();
}
