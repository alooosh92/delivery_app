import 'package:delivery_app/res/screen/item/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/item.dart';
import '../../../master_widget/color.dart';
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
    return InkWell(
      onTap: () {
        Get.to(ItemScreen(id: id));
      },
      child: Column(
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
              right: 15,
              bottom: 62,
              child: ElevWidget(
                elev: elev,
                size: 15,
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
      ),
    );
  }
}

class ElevWidget extends StatelessWidget {
  const ElevWidget({super.key, required this.elev, required this.size});

  final double elev;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Start(order: 1, elv: elev.round(), size: size),
        Start(order: 2, elv: elev.round(), size: size),
        Start(order: 3, elv: elev.round(), size: size),
        Start(order: 4, elv: elev.round(), size: size),
        Start(order: 5, elv: elev.round(), size: size),
      ],
    );
  }
}

class Start extends StatelessWidget {
  const Start({
    super.key,
    required this.order,
    required this.elv,
    required this.size,
  });
  final int order;
  final int elv;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_rounded,
      size: size,
      color: order <= elv ? Colors.amber : Colors.black26,
    );
  }
}
