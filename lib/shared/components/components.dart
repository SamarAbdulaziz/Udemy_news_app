import 'package:flutter/material.dart';

Widget buildArticleItem(articles,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image:NetworkImage('${articles['urlToImage']}',),
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
              Expanded( //i have to put expanded to make sure that the title place will be the same and the date place never change(move up)
                child: Text(
                  '${articles['title']}',
                  maxLines: 3,
                  overflow:TextOverflow.ellipsis ,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('${articles['publishedAt']}',
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
) ;
Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start:20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  ),
);