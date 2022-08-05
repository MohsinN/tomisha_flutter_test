import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_test/ui/components/space.dart';
import 'package:web_test/ui/helpers/colors.dart';

class CustomAppBar extends StatelessWidget {
  final bool? showLoginButton;

  const CustomAppBar({Key? key, this.showLoginButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )),
      child: Column(
        children: [
          Container(
              height: 5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      CustomColors.blueGradient,
                      CustomColors.greenGradient,
                    ],
                  ))),
          showLoginButton! ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Jetzt Klicken",
                  style: TextStyle(fontSize: 18, color: CustomColors.textColor),
                ),
                horizontalSpace(20),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: const BorderSide(color: Colors.grey, width: 1),
                    )),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '    Kostenlos Registrieren    ',
                      style: TextStyle(color: CustomColors.greenGradient),
                    ),
                  ),
                ),
                horizontalSpace(20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: CustomColors.greenGradient,
                          fontFamily: GoogleFonts
                              .lato()
                              .fontFamily),
                    ),
                  ),
                ),
                horizontalSpace(20),
              ],
            ),
          ) :
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Login",
                style: TextStyle(
                    color: CustomColors.greenGradient,
                    fontFamily: GoogleFonts
                        .lato()
                        .fontFamily),
              ),
            ),
          )
        ],
      ),
    );
  }
}
