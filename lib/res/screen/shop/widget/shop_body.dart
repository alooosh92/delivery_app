import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../database/shop_item.dart';
import '../../../master_widget/card_search.dart';
import '../../../master_widget/color.dart';
import '../../../master_widget/elev_widget.dart';

class ShopBody extends StatelessWidget {
  const ShopBody({super.key, required this.shop});
  final String shop;
  @override
  Widget build(BuildContext context) {
    List<Widget> lw = [];
    return FutureBuilder<ShopItem?>(
        initialData: null,
        future: ShopItem.getShop(shop),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Widget> list = [
            Image.network(
              snapshot.data!.shop!.urlImage,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: Image.network(snapshot.data!.shop!.urlLogo),
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.appbarcolor,
                      ),
                      child: Center(
                        child: Text(
                          snapshot.data!.shop!.type,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: ColorManager.textWhite),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevWidget(
                  elev: snapshot.data!.shop!.evaluation,
                  size: 25,
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: lw),
              ),
            ),
          ];
          for (var i = 0; i < snapshot.data!.items!.length; i += 2) {
            if (snapshot.data!.items!.isNotEmpty) {
              if (i + 2 <= snapshot.data!.items!.length) {
                list.add(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardSearch(
                        elev: snapshot.data!.items![i].evaluation,
                        id: snapshot.data!.items![i].id,
                        image: snapshot.data!.items![i].image,
                        itemName: snapshot.data!.items![i].name,
                        price: snapshot.data!.items![i].price,
                        shopName: snapshot.data!.shop!.shopName,
                      ),
                      CardSearch(
                        elev: snapshot.data!.items![i + 1].evaluation,
                        id: snapshot.data!.items![i + 1].id,
                        image: snapshot.data!.items![i + 1].image,
                        itemName: snapshot.data!.items![i + 1].name,
                        price: snapshot.data!.items![i + 1].price,
                        shopName: snapshot.data!.shop!.shopName,
                      ),
                    ],
                  ),
                );
              } else {
                list.add(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardSearch(
                        elev: snapshot.data!.items![i].evaluation,
                        id: snapshot.data!.items![i].id,
                        image: snapshot.data!.items![i].image,
                        itemName: snapshot.data!.items![i].name,
                        price: snapshot.data!.items![i].price,
                        shopName: snapshot.data!.shop!.shopName,
                      ),
                    ],
                  ),
                );
              }
            }
          }
          list.add(Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.appbarcolor, width: 2),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(snapshot.data!.shop!.lateLocation,
                      snapshot.data!.shop!.longLocation),
                  zoom: 16),
              markers: <Marker>{
                Marker(
                    markerId: const MarkerId("0"),
                    position: LatLng(snapshot.data!.shop!.lateLocation,
                        snapshot.data!.shop!.longLocation))
              },
            ),
          ));
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: list),
            ),
          );
        });
  }
}
