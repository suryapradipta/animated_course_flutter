import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // EMAIL START ===============================================================
          Text(
            "Email",
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ),
            ),
          ),
          // EMAIL END ===============================================================

          // PASSWORD START ===============================================================
          Text(
            "Password",
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                ),
              ),
            ),
          ),
          // PASSWORD END ===============================================================

          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 24),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF77D8E),
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),

                  ))
              ),
              icon: Icon(CupertinoIcons.arrow_right,
                color: Color(0xFFFE0037),),
              label: Text("Sign in"),
            ),
          ),
        ],
      ),
    );
  }
}