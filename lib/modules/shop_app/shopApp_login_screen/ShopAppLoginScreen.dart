import 'package:flutter/material.dart';
import 'package:udemy_news_app/modules/shop_app/register/registerScreen.dart';
import 'package:udemy_news_app/shared/components/components.dart';
import 'package:udemy_news_app/shared/styles/colors.dart';

class ShopAppLoginScreen extends StatelessWidget {
 var emailController=TextEditingController();
 var passwordController=TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style:Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'login now to browse our hot offers',
                style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),//null safety prob
              ),
              SizedBox(
                height: 30.0,
              ),
              defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'Email must not be empty';
                    }
                  },
                  label: 'Email Address',
                  prefix: Icons.email,
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                validate: (String value){
                  if(value.isEmpty){
                    return 'Password must not be empty';
                  }
                },
                label: 'Password Address',
                prefix: Icons.lock,
                suffix: Icons.visibility,
                suffixPressed: (){},
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  function: (){},
                  text: 'login',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have an account? ',
                  ),
                  defaultTextButton(
                      function: (){
                        navigateTo(context, RegisterScreen());
                      },
                      text: 'register'
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5