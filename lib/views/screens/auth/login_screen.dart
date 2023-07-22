import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Tiktok Clone',
              style: TextStyle(
                color: buttonColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w900
              ),
            ),
            Text(
                'Login',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInputField(
                controller:_emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextInputField(
                controller:_passwordController,
                labelText: 'Password',
                icon: Icons.lock,
              ),
            ),
            SizedBox(
              height: 34.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50.0,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
              child: InkWell(
                onTap: () {
                  print('pressed login');
                },
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('pressed register');
                  },
                  child: Text(
                    'Register ',
                    style: TextStyle(
                        fontSize: 20.0,
                      color: buttonColor
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
