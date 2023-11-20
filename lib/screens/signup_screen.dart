import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnakBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/images/logo.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjre3OcYTKjLiuqF3_0ko9BKwM5HQ8ZoEtv_cAd6I&s'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter Your Username',
                textEditingContoller: _usernameController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter Your Email',
                textEditingContoller: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter Your Password',
                textEditingContoller: _passwordController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter Your Bio',
                textEditingContoller: _bioController,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signUpUser,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : Container(
                        child: Text('Sign Up'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: blueColor,
                        ),
                      ),
              ),
              SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?"),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
