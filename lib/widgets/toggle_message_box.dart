import 'package:car_renr_app/constants/message_box_type.dart';
import 'package:car_renr_app/controllers/widgets/toggle_message_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleMessageBox extends StatelessWidget {
  ToggleMessageBox({super.key});
  final controller = Get.put(ToggleMessageBoxController());

  Map<String, dynamic> _getStyle(AlertType type) {
    switch (type) {
      case AlertType.error:
        return {'backgroundColor': const Color.fromRGBO(253, 237, 237, 1), 'icon': Icons.error_outline, 'color': const Color.fromRGBO(95, 33, 32, 1)};
      case AlertType.warning:
        return {'backgroundColor': const Color.fromRGBO(255, 244, 229, 1), 'icon': Icons.warning_amber_rounded, 'color': const Color.fromRGBO(102, 60, 0, 1)};
      case AlertType.success:
        return {'backgroundColor': const Color.fromRGBO(237, 247, 237, 1), 'icon': Icons.check_circle_outline, 'color': const Color.fromRGBO(30, 70, 32, 1)};
      case AlertType.info:
      default:
        return {'backgroundColor': const Color.fromRGBO(229, 246, 253, 1), 'icon': Icons.info_outline, 'color': const Color.fromRGBO(1, 67, 97, 1)};
    }
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (!controller.isVisible.value) return const SizedBox.shrink();

      final style = _getStyle(controller.alertType.value);

      return Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: style['backgroundColor'],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: style['color']
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Row(
              children: [
                Icon(style['icon'], color: style['color'],),
                const SizedBox(width: 20,),
                Flexible(child: Text(controller.message.value ?? '', style: TextStyle(color: style['color']),)),
                const SizedBox(width: 20,),
              ],
            )),
            controller.showIcon.value
                ? IconButton(
              onPressed: controller.hideMessage,
              icon: Icon(Icons.close, color: style['color'],),
            )
                : const SizedBox.shrink(),
          ],
        ),
      );
    }
    );
  }
}
