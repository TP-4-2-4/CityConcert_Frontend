import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'custom_widgets/event_card.dart';

class SuccessfulPaymentPage extends StatefulWidget {
  const SuccessfulPaymentPage({super.key});

  @override
  _SuccessfulPaymentPageState createState() => _SuccessfulPaymentPageState();
}

class _SuccessfulPaymentPageState extends State<SuccessfulPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                'Спасибо за заказ!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Text(
                  'Билет придет на указанную вами почту. Информацию о времени и месте смотрите в письме.   Благодарим за использование сервиса CityConcert.   До встречи на концерте!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 36, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const NavigationPage()));
                        },
                        style: flatroundedButtonStyleDark,
                        child: const Text(
                          'На главную',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
