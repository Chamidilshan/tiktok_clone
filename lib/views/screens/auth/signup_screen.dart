import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
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
                  'Register',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64.0,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',
                      ),
                    ),
                    Positioned(
                      bottom: -10.0,
                        left: 80.0,
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {
                            authController.pickImage();
                          },
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextInputField(
                    controller:_userNameController,
                    labelText: 'Username',
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextInputField(
                    controller:_emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                    isObscured: true,
                  ),
                ),
                SizedBox(
                  height: 15.0,
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
                    authController.registerUser(
                        _userNameController.text,
                        _emailController.text,
                        _passwordController.text,
                      authController.profilePhoto
                    );

                    },
                    child: const Center(
                      child: Text(
                        'Register',
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
                      'Already have an account? ',
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('pressed register');
                      },
                      child: Text(
                        'Login ',
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
        ),
      ),
    );
  }
}
