import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
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
          height: 200,
          decoration: const BoxDecoration(
            color: primaryColor500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90, left: 20),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: primaryColor700,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: colorWhite,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    'Indah Putri',
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
          padding: const EdgeInsets.only(top: 160),
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
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Nama',
                style: subtitleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Email',
                style: subtitleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Nama',
                style: subtitleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
