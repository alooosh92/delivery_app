import 'package:flutter/material.dart';
import '../../../database/item_info.dart';
import '../../../master_widget/elev_widget.dart';
import 'bay_button.dart';

class ItemBody extends StatelessWidget {
  const ItemBody({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemInfo?>(
      initialData: null,
      future: ItemInfo.getItemInfo(id),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          snapshot.data!.image,
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assest/images/price2.png")),
                            ),
                            child: Center(
                                child: Text(
                              snapshot.data!.price.toInt().toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "التقيم",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              ElevWidget(
                                elev: snapshot.data!.evaluation,
                                size: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.info,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BayButton(id: id, price: snapshot.data!.price)
              ],
            ),
          ),
        );
      },
    );
  }
}
