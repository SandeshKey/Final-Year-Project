import 'package:flutter/material.dart';
import 'package:olivehomes/core/service/local_auth_service.dart';
import 'package:olivehomes/core/util/colors.dart';

class FaceIDAuth extends StatefulWidget {
  const FaceIDAuth({super.key});

  @override
  State<FaceIDAuth> createState() => _FaceIDAuthState();
}

class _FaceIDAuthState extends State<FaceIDAuth> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorUtils.themeBlack,
        body: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorUtils.buttonRed,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: ColorUtils.pureWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        "Face ID Authentication",
                        style: TextStyle(
                            color: ColorUtils.pureWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 12),
              child: Text(
                "FACE ID AUTHENTICATION",
                style: TextStyle(
                  color: ColorUtils.themeBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 12),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "To authenticate yourself, please use the Face ID feature available in the navigation bar of your simulator.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 49, 49),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(64.0),
              child: Image.network(
                  "https://cdn-icons-png.flaticon.com/128/7733/7733518.png"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorUtils.buttonRed),
                ),
                onPressed: () async {
                  final authenticate = await LocalAuth.authenticate();
                  setState(() {
                    authenticated = authenticate;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "Authenticate",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            if (authenticated)
              const Text(
                "Successfully Authenticated",
                style: TextStyle(
                  color: Color.fromARGB(255, 225, 43, 43),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            if (authenticated)
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorUtils.buttonRed),
                ),
                onPressed: () {
                  setState(() {
                    authenticated = false;
                  });
                },
                child: Text("Log Out"),
              ),
          ],
        ),
      ),
    );
  }
}
