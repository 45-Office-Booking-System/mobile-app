import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kantoor_app/models/booking.dart';
import 'package:kantoor_app/viewModels/booking_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/theme.dart';

class AktifScreen extends StatefulWidget {
  const AktifScreen({Key? key}) : super(key: key);

  @override
  State<AktifScreen> createState() => _AktifScreenState();
}

class _AktifScreenState extends State<AktifScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final booking = Provider.of<BookingProvider>(context, listen: false);
      booking.getBookingAktifById(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, manager, _) {
        final isLoading = manager.stateAktif == BookingAktifState.loading;
        final isError = manager.stateAktif == BookingAktifState.error;
        final booking = manager.bookingAktif;

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
              manager.error!,
              style: titleTextStyle.copyWith(
                fontSize: 24,
                color: colorWhite,
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
                      _headerCardOrder(),
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

  _buildCardNoBooking() {
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

  _headerCardOrder() {
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
            Expanded(
              child: Text(
                "Order Details",
                style: titleTextStyle.copyWith(
                  fontSize: 18,
                  color: primaryColor900,
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
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.download_rounded,
                        color: colorWhite,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Unduh Invoice',
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
