import 'package:delivery_app/res/screen/home/widget/qote.dart';
import 'package:delivery_app/res/screen/home/widget/restorant.dart';
import 'package:delivery_app/res/screen/home/widget/search.dart';
import 'package:delivery_app/res/screen/home/widget/shops.dart';
import 'package:delivery_app/res/screen/home/widget/user_order.dart';
import 'package:flutter/material.dart';

import '../../../controller/pageview_controller.dart';
import 'accont.dart';

class AccontBody extends StatelessWidget {
  const AccontBody({
    super.key,
    required this.pageviewController,
  });

  final PageviewController pageviewController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageviewController.pageController,
      onPageChanged: (value) {
        pageviewController.onScroll(value);
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return screen[index];
      },
    );
  }
}

List screen = [
  const HomeScreen(),
  const SearchScreen(),
  const RestorantScreen(),
  const ShopsScreen(),
  const UserOrderScreen(),
  const AccontScreen(),
];
