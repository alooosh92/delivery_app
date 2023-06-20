import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/map_controller.dart';

class AddLocationButton extends StatelessWidget {
  const AddLocationButton({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    MapController controller = Get.find();
    return ElevatedButton(
        onPressed: controller.markers.isEmpty ? null : press,
        child: Text(text));
  }
}
