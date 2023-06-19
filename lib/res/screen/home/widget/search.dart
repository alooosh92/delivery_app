import 'package:flutter/material.dart';
import '../../../database/item.dart';
import '../../../master_widget/card_search.dart';
import 'text_form_field_search.dart';

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
            height: MediaQuery.of(context).size.height * 0.71,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FutureBuilder<List<Item>>(
              initialData: const [],
              future: Item.getItemByEvaluation(),
              builder: (context, snapshot) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    mainAxisExtent: 220,
                  ),
                  itemBuilder: (context, index) {
                    return CardSearch(
                      elev: snapshot.data![index].evaluation,
                      id: snapshot.data![index].id,
                      image: snapshot.data![index].image,
                      itemName: snapshot.data![index].name,
                      price: snapshot.data![index].price,
                      shopName: snapshot.data![index].shop,
                    );
                  },
                );
              },
            )),
      ],
    );
  }
}
