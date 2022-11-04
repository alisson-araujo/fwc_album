import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album/app/pages/home/widgets/sticker_percent_widget.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/bola.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: screenHeight * 0.02,
                          top: screenHeight * 0.02,
                        ),
                        child: StickerPercentWidget(
                          percent: user?.totalCompletePercent ?? 0,
                        ),
                      ),
                      Text(
                        '${user?.totalStickers ?? 0} figurinhas',
                        style: context.textStyles.titleWhite,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      StatusTile(
                        icon: Image.asset('assets/images/all_icon.png'),
                        label: 'Todas',
                        value: user?.totalAlbum ?? 0,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      StatusTile(
                        icon: Image.asset('assets/images/missing_icon.png'),
                        label: 'Faltando',
                        value: user?.totalComplete ?? 0,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      StatusTile(
                        icon: Image.asset('assets/images/repeated_icon.png'),
                        label: 'Repetidas',
                        value: user?.totalDuplicates ?? 0,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Button(
                        width: screenWidth * 0.9,
                        outline: true,
                        style: context.buttonStyles.yellowOutlineButton,
                        label: 'Minhas figurinhas',
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/my-stickers'),
                        labelStyle: context
                            .textStyles.textSecondaryFontExtraBold
                            .copyWith(color: context.colors.yellow),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
