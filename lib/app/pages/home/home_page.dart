import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/home/presenter/home_persenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album/app/pages/home/widgets/sticker_percent.dart';

class HomePage extends StatefulWidget {
  final HomePersenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.color.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/bola.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    StickerPercent(percent: user?.totalCompletePercent ?? 0),
                    const SizedBox(height: 20),
                    Text(
                      '${user?.totalStickers ?? 0} figurinhas',
                      style: context.textStyle.titleWhite,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      icon: Image.asset('assets/images/all_icon.png'),
                      label: 'Todas',
                      value: user?.totalAlbum ?? 0,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      icon: Image.asset('assets/images/missing_icon.png'),
                      label: 'Faltando',
                      value: user?.totalComplete ?? 0,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      icon: Image.asset('assets/images/repeated_icon.png'),
                      label: 'Repetidas',
                      value: user?.totalDuplicates ?? 0,
                    ),
                    const SizedBox(height: 20),
                    Button(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/my_stickers');
                      },
                      label: 'Minhas figurinhas',
                      outlined: true,
                      width: MediaQuery.of(context).size.width * .9,
                      style: context.buttonStyles.yellowOutlinedButton,
                      labelStyle:
                          context.textStyle.textSecondaryFontExtraBold.copyWith(
                        color: context.color.yellow,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
