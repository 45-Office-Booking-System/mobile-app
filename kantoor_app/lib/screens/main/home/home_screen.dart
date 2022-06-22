import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_auth.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
              color: primaryColor500.withOpacity(0.8),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang!',
                          style: titleTextStyle.copyWith(fontSize: 24.0),
                        ),
                        Text(
                          'Hi, Indah Putri!',
                          style: subtitleTextStyle.copyWith(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Image.asset(
                      "assets/icons/notification.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/icons/message.png",
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
