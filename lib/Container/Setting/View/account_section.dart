import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  // const AccountSection(this.height);
  final double height = 300;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/im_emptyIcon_2.png",
              width: 110.0,
              height: 110.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: [
                Text(
                  "Guest",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FlatButton(
                  onPressed: () => {Navigator.pushNamed(context, '/login')},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
