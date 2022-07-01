import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kantoor_app/utils/theme.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ),
        ),
        title: Text(
          'Live Chat',
          style: titleTextStyle.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          children: [
            _buildGedungCard(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: colorWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                color: colorWhite,
                border: Border.all(color: primaryColor500),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Ketikkan Pesan',
                style: subtitleTextStyle.copyWith(color: colorBlack.withOpacity(0.3)),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: primaryColor500,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: colorWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGedungCard() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: colorBlack.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/bg_detail.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      RatingStars(
                        valueLabelVisibility: false,
                        value: 3.5,
                        onValueChanged: (v) {},
                        starBuilder: (index, color) => Icon(
                          Icons.star,
                          color: color,
                        ),
                        starCount: 5,
                        starSize: 15,
                        maxValue: 5,
                        starSpacing: 2,
                        animationDuration: const Duration(milliseconds: 1000),
                        valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                        valueLabelMargin: const EdgeInsets.only(right: 8),
                        starOffColor: const Color(0xffe7e8ea),
                        starColor: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                        child: Text(
                          '(3.5/5)',
                          style: subtitleTextStyle.copyWith(
                            color: colorBlack,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Office Meeting Room Montana Building lt 7',
                    style: titleTextStyle.copyWith(
                      fontSize: 16,
                      color: colorBlack,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  Text(
                    'Rp. 1.000.000,-',
                    style: titleTextStyle.copyWith(
                      fontSize: 20.0,
                      color: primaryColor500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
