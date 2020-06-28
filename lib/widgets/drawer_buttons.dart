import 'package:flutter/material.dart';
import 'package:gogame_animation/utils/strings.dart';

class DrawerButtons extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const DrawerButtons({Key key, this.onChanged})
      : assert(onChanged != null),
        super(key: key);
  @override
  _DrawerButtonsState createState() => _DrawerButtonsState();
}

class _DrawerButtonsState extends State<DrawerButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          drawerMenu.length,
          (index) => button(
            drawerMenu[index],
            index,
          ),
        ),
        Spacer(),
        button(
          termsAndConditions,
          drawerMenu.length,
        ),
        button("v1", null),
      ],
    );
  }

  Widget button(String text, int index) => GestureDetector(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            text,
            style: TextStyle(
              color: selectedIndex == index ? Colors.orange : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        onTap: index == null
            ? null
            : () {
                if (selectedIndex != index) {
                  selectedIndex = index;
                  widget.onChanged(index);
                  setState(() {});
                }
              },
      );
}
