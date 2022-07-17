import 'package:flutter/material.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/auth_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 12.0,
            ),
            _buildCardProfile('Fullname', user.fullname),
            _buildCardProfile('Email', user.email),
            _buildCardProfile('Alamat', user.alamat),
            _buildCardProfile('Phone', user.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          decoration: const BoxDecoration(
            color: primaryColor500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 20),
          child: Row(
            children: [
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: primaryColor700,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorWhite, width: 2.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    user.name,
                    style: titleTextStyle.copyWith(
                      fontSize: 24,
                      color: colorWhite,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Center(
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profil Akun',
                    style: titleTextStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Edit Profil',
                          style: subtitleTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(
                          Icons.edit,
                          size: 15,
                          color: colorBlack,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.yellow,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                        (route) => false,
                      );
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('idUser');
                      prefs.remove('token');
                      prefs.remove('expiryDate');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: subtitleTextStyle.copyWith(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(
                          Icons.logout,
                          color: colorWhite,
                          size: 15,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildCardProfile(key, value) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        margin: const EdgeInsets.all(12.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildKeyProfile(key),
              _buildValueProfile(value),
            ],
          ),
        ),
      ),
    );
  }

  _buildKeyProfile(text) {
    return Text(
      text,
      style: titleTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildValueProfile(text) {
    return Text(
      text,
      style: subtitleTextStyle.copyWith(
        fontSize: 16,
      ),
    );
  }
}
