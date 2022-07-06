import 'package:flutter/material.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/utils/theme.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: primaryColor500,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
              ),
              _buildProfileImage(user.imgPath),
              const SizedBox(
                height: 10,
              ),
              _buildProfileName(user.nama)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: colorWhite,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[350],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Profil Akun',
                          style: titleTextStyle.copyWith(
                            color: colorBlack,
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Verifikasi Akun'),
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 40),
                              primary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Text('Logout '),
                              Icon(Icons.logout),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(110, 40),
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildFieldProfile('Nama'),
                              _buildFieldProfile('Email'),
                              _buildFieldProfile('Username'),
                              _buildFieldProfile('Jenis Kelamin'),
                              _buildFieldProfile('Alamat'),
                              _buildFieldProfile('Handphone'),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            width: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldProfile(user.nama),
                              _buildFieldProfile(user.email),
                              _buildFieldProfile(user.username),
                              _buildFieldProfile(user.jnsKelamin),
                              _buildFieldProfile(user.alamat),
                              _buildFieldProfile(user.noHP),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFieldProfile(data) {
    return Text(
      data,
      style: subtitleTextStyle.copyWith(
        fontSize: 14,
        color: colorBlack,
      ),
    );
  }

  _buildProfileName(nama) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nama,
            style: titleTextStyle.copyWith(
              fontSize: 18,
              color: colorBlack,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Ubah Profil',
              style: subtitleTextStyle.copyWith(
                color: colorWhite,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildProfileImage(image) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 38.0,
      child: CircleAvatar(
        radius: 35.0,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
