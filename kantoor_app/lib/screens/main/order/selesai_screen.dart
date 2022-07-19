import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/main/order/review_screen.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeaderCardOrder(),
            _buildBodyTiket(),
          ],
        ),
      ),
    );
  }

  _buildCardNoBooking() {
    return Column(
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
    );
  }

  _buildHeaderCardOrder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: primaryColor100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              "Order Details",
              style: titleTextStyle.copyWith(
                fontSize: 18,
                color: primaryColor900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _buildBodyTiket() {
    return Column(
      children: [
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width,
          color: primaryColor900,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 10.0, right: 10.0, bottom: 3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  elevation: 2.0,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/bg_detail.png',
                    ),
                  ),
                ),
                Text(
                  'Office Meeting Room Montana Building lt 7',
                  style: titleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                Text(
                  'Kota Surabaya',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Date',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                      Text(
                        '20-07-2022',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check In',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                      Text(
                        '20-08-2022',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check Out',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                      Text(
                        '20-08-2022',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Booking Code',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                      Text(
                        'c25cZ10L',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 12,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(primaryColor500),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewGedung(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.rate_review_rounded,
                        color: colorWhite,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Buat Review',
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
        ),
      ],
    );
  }
}
