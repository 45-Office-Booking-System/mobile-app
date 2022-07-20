import 'package:flutter/material.dart';
import 'package:kantoor_app/screens/main/order/aktif_screen.dart';
import 'package:kantoor_app/screens/main/order/selesai_screen.dart';
import 'package:kantoor_app/utils/theme.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order",
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
        backgroundColor: colorWhite,
        centerTitle: true,
        elevation: 0.0,
        bottom: TabBar(
          controller: _tabController,
          labelStyle: titleTextStyle.copyWith(fontSize: 16),
          labelColor: colorBlack,
          unselectedLabelColor: colorBlack,
          indicatorColor: colorBlack,
          tabs: const [
            Tab(
              text: "Aktif",
            ),
            Tab(
              text: "Selesai",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AktifScreen(),
          SelesaiScreen(),
        ],
      ),
    );
  }
}
