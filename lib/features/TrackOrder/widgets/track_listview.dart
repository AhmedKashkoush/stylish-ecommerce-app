import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/features/TrackOrder/widgets/order_listtile.dart';

// ignore: must_be_immutable
class TrackListview extends StatelessWidget {
  const TrackListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderListTile(
          padding: 0,
          img: 'assets/images/order.png',
          imgColor: const Color(0xffFFFAEB),
          title: 'Order Taken',
          trailingWidget: Image.asset('assets/images/done.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset('assets/images/track.png'),
        ),
        OrderListTile(
          padding: 0,
          img: 'assets/images/prepare.png',
          imgColor: const Color(0xffF1EFF6),
          title: 'Order Is Being Prepared',
          trailingWidget: Image.asset('assets/images/done.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset('assets/images/track.png'),
        ),
        OrderListTile(
          padding: 0,
          img: 'assets/images/delivery.png',
          imgColor: const Color(0xffFEF0F0),
          subTitle: 'Your delivery agent is coming',
          title: 'Order Is Being Delivered',
          trailingWidget: CircleAvatar(
            backgroundColor: const Color(0xffF83758),
            radius: 22,
            child: Image.asset('assets/images/phone.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset('assets/images/track.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Image.asset(
            'assets/images/map.png',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset('assets/images/track.png'),
        ),
        OrderListTile(
          padding: 0,
          img: 'assets/images/bigDone.png',
          imgColor: const Color(0xffF0FEF8),
          title: 'Order Received',
          trailingWidget: Image.asset('assets/images/dot.png'),
        ),
      ],
    );
  }
}
