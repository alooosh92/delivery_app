import 'package:delivery_app/res/master/api.dart';
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
            height: MediaQuery.of(context).size.height * 0.71,
            width: MediaQuery.of(context).size.width * 0.9,
            child: FutureBuilder<List<ItemByEvaluation>>(
              initialData: const [],
              future: ItemByEvaluation.getItemByEvaluation(),
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

class CardSearch extends StatelessWidget {
  const CardSearch(
      {super.key,
      required this.id,
      required this.elev,
      required this.image,
      required this.itemName,
      required this.price,
      required this.shopName});
  final String id;
  final String image;
  final String itemName;
  final String shopName;
  final double price;
  final double elev;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 175,
            width: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                Image.network(
                  image,
                  height: 125,
                  width: 125,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorManager.textWhite,
                  ),
                  width: 150,
                  height: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(itemName),
                        Row(
                          children: [
                            Start(order: 1, elv: elev.round()),
                            Start(order: 2, elv: elev.round()),
                            Start(order: 3, elv: elev.round()),
                            Start(order: 4, elv: elev.round()),
                            Start(order: 5, elv: elev.round()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: 150,
                  height: 25,
                  child: Center(child: Text(shopName)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 55,
            left: 0,
            child: Container(
              width: 80,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assest/images/price2.png")),
              ),
              child: Center(
                  child: Text(
                price.toInt().toString(),
                style: const TextStyle(fontWeight: FontWeight.w700),
              )),
            ),
          ),
        ]),
      ],
    );
  }
}

class Start extends StatelessWidget {
  const Start({
    super.key,
    required this.order,
    required this.elv,
  });
  final int order;
  final int elv;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: order <= elv,
      child: const Icon(
        Icons.star_rate_rounded,
        size: 10,
        color: Colors.amber,
      ),
    );
  }
}
