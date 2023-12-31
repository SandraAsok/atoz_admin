import 'package:atoz_admin/core/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  final String text;
  final String iconurl;
  final Color color;
  final bool networkOrAsset = true;
  final Color? fontcolor;
  final Widget? widget;
  Future<void>? funtion;

  MainButton(
      {super.key,
      required this.text,
      this.funtion,
      this.fontcolor,
      required this.iconurl,
      this.widget,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget != null
          ? () {
              funtion;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widget!,
                  ));
            }
          : null,
      hoverColor: grey,
      child: Container(
        width: size.width * 0.9,
        height: size.width * 0.13,
        decoration: BoxDecoration(
            border: Border.all(color: white),
            borderRadius: BorderRadius.circular(20),
            color: color),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 30,
                  child: networkOrAsset
                      ? Image.network(iconurl)
                      : Image.asset(iconurl)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
