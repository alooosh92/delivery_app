import 'package:delivery_app/res/master/color.dart';
import 'package:flutter/material.dart';

import '../widget/text_form_field_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldSearch(
          text: 'مطعم, متجر, صنف...',
          onchanged: (val) {},
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GridView.builder(
            itemCount: 15,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              mainAxisExtent: null,
            ),
            itemBuilder: (context, index) {
              return const CardSearch();
            },
          ),
        ),
      ],
    );
  }
}

class CardSearch extends StatelessWidget {
  const CardSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: ColorManager.appbarcolor,
            boxShadow: [
              BoxShadow(
                  color: ColorManager.appbarcolor,
                  offset: Offset.zero,
                  blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assest/images/1.png',
                height: 125,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: ColorManager.textWhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: 150,
                height: 25,
                child: const Center(child: Text('data')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
