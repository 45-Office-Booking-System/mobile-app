import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class AktifScreen extends StatefulWidget {
  const AktifScreen({Key? key}) : super(key: key);

  @override
  State<AktifScreen> createState() => _AktifScreenState();
}

class _AktifScreenState extends State<AktifScreen> {
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

  Widget _buildBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: const Icon(Icons.list),
            trailing: const Text(
              "GFG",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            title: Text("List item $index"));
      },
    );
  }
}
