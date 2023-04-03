import 'package:flutter/material.dart';

class FloatingDropDownButton extends StatelessWidget {
  const FloatingDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Wrap(children: [
        Text(
          "Development",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Icon(Icons.arrow_drop_down,size: 18,color: Colors.black,)
      ]),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      ),
    );
  }
}
