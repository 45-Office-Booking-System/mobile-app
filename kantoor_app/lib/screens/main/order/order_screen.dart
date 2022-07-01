import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            // Expanded(
            //   child: _buildBody(),
            // ),
            const SizedBox(
              height: 240,
            ),
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: primaryColor500,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Text(
        'Order',
        style: titleTextStyle.copyWith(
          fontSize: 20,
          color: colorWhite,
        ),
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
