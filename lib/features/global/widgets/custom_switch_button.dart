import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: Switch(
        value: _value,
        activeColor: R.colors.white,
        inactiveTrackColor: R.colors.blackWithOpacity.withOpacity(0.25),
        activeTrackColor: R.colors.secondaryColor,
        thumbIcon: MaterialStateProperty.all(const Icon(null)),
        trackOutlineColor: MaterialStateProperty.all(R.colors.transparent),
        thumbColor: MaterialStateProperty.all(R.colors.white),
        onChanged: (value) {
          setState(() {
            _value = value;
            widget.onChanged(_value);
          });
        },
      ),
    );
  }
}
