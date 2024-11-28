import 'package:car_renr_app/models/message_box_type.dart';
import 'package:flutter/material.dart';

class ToggleMessageBox extends StatefulWidget {
  const ToggleMessageBox({super.key});

  @override
  State<ToggleMessageBox> createState() => ToggleMessageBoxState();
}

class ToggleMessageBoxState extends State<ToggleMessageBox> {
  bool _messageBoxVisibility = false;
  bool _showIcon = false;
  String? _message;
  AlertType _type = AlertType.success;
  late Map<String, dynamic> _style;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _style = _getStyle();
  }

  Map<String, dynamic> _getStyle() {
    switch (_type) {
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

  // Method to update state
  void updateState(bool visibility, String? message, AlertType type, bool showIcon) {
    setState(() {
      _messageBoxVisibility = visibility;
      _message = message;
      _showIcon = showIcon;
      _type = type;
    _style = _getStyle();
    });
  }



  @override
  Widget build(BuildContext context) {
    if (!_messageBoxVisibility) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: _style['backgroundColor'],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _style['color']
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Row(
            children: [
              Icon(_style['icon'], color: _style['color'],),
              const SizedBox(width: 20,),
              Flexible(child: Text(_message ?? '', style: TextStyle(color: _style['color']),)),
              const SizedBox(width: 20,),
            ],
          )),
          _showIcon
              ? IconButton(
            onPressed: () {
              setState(() {
                _messageBoxVisibility = false;
                _message = null;
              });
            },
            icon: Icon(Icons.close, color: _style['color'],),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
