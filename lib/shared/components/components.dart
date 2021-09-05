import 'package:flutter/material.dart';
import 'package:udemy_news_app/modules/news_app/webView_Screen/web_View_screen.dart';

Widget buildArticleItem(articles, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(articles?["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    '${articles['urlToImage']}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      //i have to put expanded to make sure that the title place will be the same and the date place never change(move up)

                      child: Text(
                        '${articles['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, context) {
  return ListView.separated(
    physics:
        BouncingScrollPhysics(), //to make the scrolling color disappear try to remover it if you forgot it.
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!;
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultTextButton({
  required Function function,
  required String text,
}) {
  return TextButton(
    onPressed: () {
      function();
    },
    child: Text(
      text.toUpperCase(),
    ),
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double radius = 3.0,
}) {
  return Container(
    width: width ,
    height: 50.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
    radius,
  ),
  color: background,
  ),
    child: MaterialButton(
      onPressed: () {
        function();
      },
      child: Text(
       isUpperCase ? text.toUpperCase():text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
