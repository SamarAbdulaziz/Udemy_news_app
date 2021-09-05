import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_news_app/modules/shop_app/shopApp_login_screen/ShopAppLoginScreen.dart';
import 'package:udemy_news_app/shared/components/components.dart';
import 'package:udemy_news_app/shared/styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController =PageController();

  List<BoardingModel>boarding=[
    BoardingModel(image:'assets/images/shopping_cart.jpg' ,title: 'Screen Title 1',body: 'Screen Body 1',),
    BoardingModel(image:'assets/images/shopping_cart.jpg' ,title: 'Screen Title 2',body: 'Screen Body 2',),
    BoardingModel(image:'assets/images/shopping_cart.jpg' ,title: 'Screen Title 3',body: 'Screen Body 3',),
  ];
bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function:(){
                navigateAndFinish(context,ShopAppLoginScreen());
                },
              text: 'skip'),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller:boardController,
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index){
                  if(index==boarding.length-1){
                   setState(() {
                     isLast=true;
                   });
                  }
                  else
                   {
                    setState(() {
                      isLast=false;
                    });
                   }
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                effect:ExpandingDotsEffect(
                  dotColor: Colors.grey,//we don't need it since it's default color is grey
                  activeDotColor: defaultColor,
                  dotHeight:10 ,
                  dotWidth:  10,
                  expansionFactor: 3,//we don't need it since it's default num=3
                  spacing: 5,
                ) ,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast){
                      navigateAndFinish(context, ShopAppLoginScreen());

                    }
                    else
                    boardController.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),//in case of a big image i will need a space between it and the text below
        Text(
          '${model.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.body}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
