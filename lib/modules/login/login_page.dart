import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    bottom: size.height * 0.05,
                  ),
                  child: Image.asset(
                    AppImages.person,
                    height: size.height * 0.4,
                  ),
                ),
                Image.asset(AppImages.logomini),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
                  child: Text(
                    'Organize seus boletos em um só lugar',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleHome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 40,
                  ),
                  child: SocialLoginButton(
                    onTap: () async {
                      GoogleSignIn _googleSignIn = GoogleSignIn(
                        scopes: [
                          'email',
                        ],
                      );
                      try {
                        final response = await _googleSignIn.signIn();
                        print(response);
                      } catch (error) {
                        print(error);
                        return;
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
