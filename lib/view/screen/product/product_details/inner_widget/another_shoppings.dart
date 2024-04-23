

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'another_shoppings_list_item.dart';

class AnotherShopping extends StatelessWidget {
  const AnotherShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
      return AnotherShoppingListItem() ;
    },);
  }
}
