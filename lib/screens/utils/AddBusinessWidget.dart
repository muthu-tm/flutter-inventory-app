import 'package:flutter/material.dart';
import 'package:greenland_stock/constants.dart';
import 'package:greenland_stock/screens/utils/CustomColors.dart';

class AddBusinessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, businessAddRoute),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Container(
          width: 175,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.store_mall_directory,
                color: CustomColors.white,
                size: 30,
              ),
              Text(
                "Add New Store",
                style: TextStyle(color: CustomColors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
