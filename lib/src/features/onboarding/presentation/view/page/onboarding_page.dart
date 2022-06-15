import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

Widget get _loginButton => Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
        color: Colors.black,
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed('/login');
          },
          child: Padding(
            padding: signinButtonPadding,
            child: Text(
              'skip'.i18n(),
              style: signinButtonTextStyle,
            ),
          ),
        ),
      ),
    );

class _OnboardingState extends State<OnboardingPage> {
  late ColorScheme _colors;
  late ThemeData _theme;
  late int? index;

  @override
  Widget build(BuildContext context) {
    final onboardingPagesList = [
      PageModel(
        widget: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Image(
                  image: AssetImage('lib/assets/images/lamp_outline_icon.png'),
                  height: 140,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Atuamente a disseminação de fakes news tem se tornado um grande desafio. Este modelo de desinformação deve ser combatido.',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Image(
                  image: AssetImage('lib/assets/images/fake news_icon.png'),
                  height: 140,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Fake news são notícias falsa publicadas por veículos de comunicação como se fossem reais.',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      PageModel(
        widget: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Image(
                  image:
                      AssetImage('lib/assets/images/percentage_round_icon.png'),
                  height: 140,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Verifique o indicador no canto superior esquerdo do card da notícia, para saber se a notícia é verdadeira ou falsa.',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Onboarding(
              pages: onboardingPagesList,
              onPageChange: (int pageIndex) {
                index = pageIndex;
              },
              footerBuilder: (context, dragDistance, pagesLength, setIndex) {
                return Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                              indicatorDesign: IndicatorDesign.polygon(
                                polygonDesign: PolygonDesign(
                                  polygon: DesignType.polygon_circle,
                                ),
                              ),
                              activeIndicator: const ActiveIndicator(
                                  color: Colors.black, borderWidth: 1),
                              closedIndicator: const ClosedIndicator(
                                  color: Colors.black, borderWidth: 10)),
                        ),
                      ),
                      _loginButton
                    ],
                  ),
                );
              }),
        ));
  }
}
