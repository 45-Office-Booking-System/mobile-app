import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kantoor_app/models/booking.dart';
import 'package:kantoor_app/screens/main/order/review_screen.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/booking_provider.dart';
import 'package:provider/provider.dart';

class SelesaiScreen extends StatefulWidget {
  const SelesaiScreen({Key? key}) : super(key: key);

  @override
  State<SelesaiScreen> createState() => _SelesaiScreenState();
}

class _SelesaiScreenState extends State<SelesaiScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final booking = Provider.of<BookingProvider>(context, listen: false);
      booking.getBookingSelesaiById(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, manager, _) {
        final isLoading = manager.stateSelesai == BookingSelesaiState.loading;
        final isError = manager.stateSelesai == BookingSelesaiState.error;
        final booking = manager.bookingSelesai;

        if (isLoading) {
          return const Center(
            child: JumpingDots(
              color: primaryColor500,
              radius: 16,
              innerPadding: 4,
              numberOfDots: 3,
              animationDuration: Duration(milliseconds: 200),
            ),
          );
        }

        if (isError) {
          return Center(
            child: Text(
              manager.error!.toUpperCase(),
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          );
        }

        if (booking != null) {
          final data = booking.data;
          if (data != null) {
            if (data.isNotEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildHeaderCardOrder(),
                      _buildBodyTiket(data[0]),
                    ],
                  ),
                ),
              );
            } else {
              return _buildCardNoBooking();
            }
          } else {
            return _buildCardNoBooking();
          }
        } else {
          return _buildCardNoBooking();
        }
      },
    );
  }

  Widget _buildCardNoBooking() {
    return Column(
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
    );
  }

  _buildHeaderCardOrder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
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
            Expanded(
              child: Text(
                "Order Details",
                style: titleTextStyle.copyWith(
                  fontSize: 18,
                  color: primaryColor700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  _buildBodyTiket(Data booking) {
    final gedung = booking.gedung;

    return Column(
      children: [
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width,
          color: colorBlack.withOpacity(0.6),
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
                  gedung?[0].name ?? 'Cant load name',
                  style: titleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                Text(
                  gedung?[0].location ?? 'Cant load location',
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
                        booking.orderdate!,
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
                        booking.checkin!,
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
                        booking.checkout!,
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
                        booking.bookingcode!,
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
                        builder: (context) => ReviewGedung(
                          idGedung: gedung?[0].id ?? 3,
                        ),
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
