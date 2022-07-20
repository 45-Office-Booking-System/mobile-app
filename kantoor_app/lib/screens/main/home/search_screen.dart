import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: colorBlack,
          ),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: colorWhite,
          ),
        ),
      ),
    );
  }
}
