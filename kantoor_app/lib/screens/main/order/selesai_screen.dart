import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class SelesaiScreen extends StatefulWidget {
  const SelesaiScreen({Key? key}) : super(key: key);

  @override
  State<SelesaiScreen> createState() => _SelesaiScreenState();
}

class _SelesaiScreenState extends State<SelesaiScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/null.png'),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            'Belum ada booking',
            style: subtitleTextStyle.copyWith(
              color: colorBlack.withOpacity(0.4),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
