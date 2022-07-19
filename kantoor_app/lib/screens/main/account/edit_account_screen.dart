import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantoor_app/models/user.dart';
import 'package:kantoor_app/utils/theme.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ),
        ),
        title: Text(
          "Edit Profil",
          style: titleTextStyle.copyWith(fontSize: 16, color: colorBlack),
        ),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            _buildKeyField(
                Icons.person, "Nama Lengkap", user.name, "Nama Lengkap"),
            _buildKeyField(Icons.email, "Email", user.email, "Email"),
            _buildKeyField(
                Icons.smartphone, "No. Handphone", user.phone, "No.Handpone"),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(primaryColor500),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Simpan Perubahan',
                    style: subtitleTextStyle.copyWith(
                      color: colorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildKeyField(icon, key, initial, hintText) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: primaryColor900,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              key,
              style: titleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor900,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 3.0,
        ),
        TextFormField(
          initialValue: initial,
          style: subtitleTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: subtitleTextStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          ),
          onChanged: (value) => setState(() => initial = value),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
