import 'package:flutter/material.dart';

class GarethCheckbox extends StatefulWidget {
  const GarethCheckbox({
    Key? key,
    required this.size,
    required this.value,
    this.tristate = false,
    required this.onChange,
    this.boxColor,
    this.borderColor,
    this.cornerRadius,
    this.iconSize,
    this.iconColor,
    this.nullIcon,
    this.checkedIcon,
  }) : super(key: key);

  final void Function(bool?)? onChange;
  final bool? value;
  final Size size;
  final Color? boxColor;
  final Color? borderColor;
  final double? cornerRadius;
  final double? iconSize;
  final Color? iconColor;
  final bool tristate;
  final IconData? nullIcon;
  final IconData? checkedIcon;

  @override
  State<GarethCheckbox> createState() => _GarethCheckboxState();
}

class _GarethCheckboxState extends State<GarethCheckbox> {
  bool? _isChecked;
  late bool _isTristate;

  @override
  void initState() {
    _isChecked = widget.value;
    _isTristate = widget.tristate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChange != null
          ? () {
              _isTristate ? tristateLifecycle() : bistateLifecycle();
              widget.onChange!(_isChecked);
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Container(
          decoration: BoxDecoration(
            color: colorSwitcher(_isChecked),
            borderRadius: BorderRadius.circular(3),
            border: borderState(_isChecked),
          ),
          width: widget.size.width,
          height: widget.size.height,
          child: iconSwitcher(_isChecked),
        ),
      ),
    );
  }

  void tristateLifecycle() {
    setState(() {
      switch (_isChecked) {
        case true:
          _isChecked = null;
          break;
        case null:
          _isChecked = false;
          break;
        default:
          _isChecked = true;
          break;
      }
    });
  }

  void bistateLifecycle() {
    setState(() {
      switch (_isChecked) {
        case false:
          _isChecked = true;
          break;
        default:
          _isChecked = false;
          break;
      }
    });
  }

  Icon? iconSwitcher(bool? value) {
    switch (value) {
      case true:
        return Icon(
          widget.checkedIcon ?? Icons.check,
          color: widget.iconColor,
          size: widget.iconSize,
        );
      case null:
        return Icon(
          widget.nullIcon ?? Icons.remove,
          color: widget.iconColor,
          size: widget.iconSize,
        );
      default:
        return null;
    }
  }

  Color? colorSwitcher(bool? value) {
    switch (value) {
      case false:
        return Colors.transparent;
      default:
        return widget.onChange != null
            ? widget.boxColor ?? Colors.blue
            : Colors.grey.shade400;
    }
  }

  BoxBorder? borderState(bool? value) {
    switch (value) {
      case false:
        return Border.all(
          color: widget.onChange != null
              ? widget.borderColor ?? Colors.black
              : Colors.grey.shade400,
          width: 4,
          style: BorderStyle.solid,
        );
      default:
        return null;
    }
  }
}
