import 'package:delivery_app/res/controller/map_controller.dart';
import 'package:delivery_app/res/master_widget/show_dialog_def.dart';
import 'package:delivery_app/res/screen/item/item.dart';
import 'package:delivery_app/res/screen/shop/shop.dart';
import 'package:delivery_app/res/screen/userinfo/user_info.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../database/item.dart';
import '../database/qote_Today.dart';
import '../database/shop.dart';
import '../database/user_info.dart';
import '../database/user_location.dart';
import '../database/user_order.dart';
import '../screen/home/widget/image_card.dart';
import '../screen/home/widget/info_card.dart';
import '../screen/home/widget/row_descoine.dart';
import '../screen/home/widget/shop_card.dart';
import '../screen/home/widget/table_row_item.dart';
import '../screen/map/map.dart';
import '../screen/userlocation/user_location.dart';

class HomeController extends GetxController {
  int page = 0;
  String? userlocationId;
  LatLng userlocation = const LatLng(0, 0);
  List<UserLocation> locationsList = [];
  Userinfo? userinfo;
  List<QoteToday> qoteTodayList = [];
  List<Item> itemList = [];
  List<Shop> restorantList = [];
  List<Shop> shopList = [];
  List<UserOrder> userOrderList = [];
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  void onInit() async {
    getLocation();
    getUserInfo();
    getQoteToday();
    getItem();
    getshop();
    // await getUserOrder();
    super.onInit();
    update();
  }

  void getLocation() async {
    locationsList.clear();
    var list = await UserLocation.getUserLocation();
    for (var element in list) {
      locationsList.add(element);
    }
    update();
  }

  void getUserInfo() async {
    userinfo = null;
    var info = await Userinfo.getUserInfo();
    userinfo = info;
    update();
  }

  void getQoteToday() async {
    qoteTodayList.clear();
    var list = await QoteToday.getQoteToday();
    for (var element in list) {
      qoteTodayList.add(element);
    }
    update();
  }

  void getItem() async {
    itemList.clear();
    var list = await Item.getItemByEvaluation();
    for (var element in list) {
      itemList.add(element);
    }
    update();
  }

  void getshop() async {
    restorantList.clear();
    shopList.clear();
    var list = await Shop.getShopRegion();
    for (var element in list) {
      if (element.isFood) {
        restorantList.add(element);
      } else {
        shopList.add(element);
      }
    }
    update();
  }

  Future<List<UserOrder>> getUserOrder() async {
    userOrderList.clear();
    var list = await UserOrder.getUserOrder();
    for (var element in list) {
      userOrderList.add(element);
    }
    return userOrderList;
  }

  void changeUserLocation(String val) {
    var loc = locationsList.firstWhere((element) => element.id == val);
    userlocationId = loc.id;
    userlocation = LatLng(loc.locationLate, loc.locationLong);
    update();
  }

  void clickShop(String id) {
    Get.to(ShopScreen(shop: id));
  }

  void clickItem(String id) {
    Get.to(ItemScreen(id: id));
  }

  void clickOrderConferm(String id) async {
    Get.dialog(
      await showDialogDef(
        ok: () async {
          var b = await UserOrder.doneOrder(id);
          if (b) {
            Get.back();
            await showDialogDef(
              ok: () {
                Get.back();
              },
              okText: "موافق",
              title: "ملاحظة",
              masseg: "تم تأكيد الطلبية بنجاح",
            );
          } else {
            Get.back();
            await showDialogDef(
              ok: () {
                Get.back();
              },
              okText: "موافق",
              title: "تحذير",
              masseg: "حدث خطأ ما الرجاء التواصل معنا",
            );
          }
        },
        okText: "تأكيد",
        title: "تنبيه",
        masseg:
            "هل أنت متأكد من تثبيت الطلبية \n ملاحظة: لايمكن حذف او تعديل الطلبية بعد التثبيت",
        closText: "إلغاء",
        close: () {
          Get.back();
        },
      ),
    );
    await getUserOrder();
    update();
  }

  void clickDeleteOrder(String id) async {
    Get.dialog(
      await showDialogDef(
        ok: () async {
          var b = await UserOrder.deleteOrder(id);
          if (b) {
            Get.back();
            await showDialogDef(
              ok: () {
                Get.back();
              },
              okText: "موافق",
              title: "ملاحظة",
              masseg: "تم حذف الطلبية بنجاح",
            );
          } else {
            Get.back();
            await showDialogDef(
              ok: () {
                Get.back();
              },
              okText: "موافق",
              title: "تحذير",
              masseg: "حدث خطأ ما الرجاء التواصل معنا",
            );
          }
        },
        close: () {
          Get.back();
        },
        okText: "حذف",
        closText: "إلغاء",
        title: "تحذير",
        masseg: "هل أنت متأكد من حذف هذه الطلبية؟",
      ),
    );
    await getUserOrder();
    update();
  }

  void clickBtnUserInfoScreen() {
    Get.to(const UserInfoScreen());
  }

  void clickBtnUserLocationScreen() {
    Get.to(const UserLocationScreen());
  }

  void clickBtnSetting() {}

  void clickBtnConuctUs() {}

  void clickBtnAddRequstInMap() {
    Get.to(MapScreen(text: 'تحديد مكان استلام الطلب', press: () {}));
  }

  void pageIndex(double index) {
    pageController.animateToPage(index.toInt(),
        duration: const Duration(milliseconds: 2000), curve: Curves.easeInOut);
  }

  void onScroll(int page) {
    pageScroll(page.toDouble());
  }

  void pageScroll(double pageNumber) {
    page = pageNumber.toInt();
    update();
  }

  void pageClick(double pageNumber) {
    page = pageNumber.toInt();
    pageIndex(page.toDouble());
    update();
  }

  void onOrderClick(String id) async {
    showDialogDef(
      ok: () async {
        Get.back();
        await UserOrder.doneOrder(id);
      },
      close: () {
        Get.back();
      },
      closText: "إلغاء",
      okText: "تثبيت",
      title: "تأكيد الطلبية",
      masseg:
          "هل أنت متأكد من تثبيت الطلبية؟\nملاحظة: بعد تأكيد الطلبية لا يمكن إلغائها أو تعديلها",
    );
    await getUserOrder();
    update();
  }

  List<Widget> qoteListScreen() {
    Map<String, List<Widget>> type = {};
    // ignore: unused_local_variable
    List<ImageCard> l = [];
    for (var element in qoteTodayList) {
      type.addIf(!type.containsKey(element.shoptype), element.shoptype, l = []);
      type[element.shoptype]!.add(
        ImageCard(
          path: element.imageUrl,
          press: () {
            Get.to(ShopScreen(shop: element.shopId));
          },
        ),
      );
    }
    List<Widget> out = [];
    type.forEach((key, value) {
      out.add(RowDescoine(listWidget: value));
    });
    return out;
  }

  List<Widget> shopDescriptionList(List<String> descriptions) {
    List<Widget> lw = [];
    for (var element in descriptions) {
      lw.add(InfoCard(
        text: element,
        heigh: 25,
        margin: 5,
        textSize: 10,
      ));
    }
    return lw;
  }

  String getPriceBetweenToPoint(LatLng to) {
    double p = Geolocator.distanceBetween(
      userlocation.latitude,
      userlocation.longitude,
      to.latitude,
      to.longitude,
    );
    var price = ((p / 1000).ceil()) * 1500;
    return price > 100000 ? "حدد العنوان" : price.toString();
  }

  List<Widget> getListShop(List<Shop> listShop) {
    List<Widget> list = [];
    for (var element in listShop) {
      var sh = ShopCard(
        shop: element,
      );
      list.add(sh);
    }
    return list;
  }

  List<TableRow> getOrderListItem(List<TabelRowItem> listOrder) {
    List<TableRow> list = [
      tabelRowHeader(),
    ];
    for (var element in listOrder) {
      list.add(tabelRowItem(element.item, element.number, element.price));
    }
    return list;
  }

  int getOrderListPrice(List<TabelRowItem> listOrder) {
    var price = 0;
    for (var element in listOrder) {
      price += element.number * element.price;
    }
    return price;
  }

  List<DropdownMenuItem<String>> buildLocationList() {
    List<DropdownMenuItem<String>> list = [dropdownMenuItemDefAdd()];
    for (var element in locationsList) {
      var ddm = dropdownMenuItemDef(
        element.id,
        element.locationLate,
        element.locationLong,
        element.description,
      );
      list.add(ddm);
    }
    return list;
  }
}

DropdownMenuItem<String> dropdownMenuItemDefAdd() {
  MapController mc = Get.find();
  return DropdownMenuItem<String>(
    value: '0',
    child: InkWell(
      onTap: () {
        Get.back();
        Get.to(
          MapScreen(
              text: 'إضافة الموقع محدد إلى المفضلة', press: mc.clickMapButton),
        );
      },
      child: const Row(
        children: [
          Icon(Icons.add_box_outlined),
          Text('إضافة موقع جديد'),
        ],
      ),
    ),
  );
}

DropdownMenuItem<String> dropdownMenuItemDef(
    String id, double late, double long, String text) {
  return DropdownMenuItem<String>(
    value: id,
    child: Row(
      children: [
        Text(text),
      ],
    ),
  );
}
