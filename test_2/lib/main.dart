import 'dart:html';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第九章 动画',
      home: Scaffold(
        appBar: AppBar(
          title: Text('cartoon'),
          elevation: 30.0, //设置标题阴影 不需要的话值设置成 0.0
        ),
        body: HeroAnimationRouteA(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.network("https://pic2.zhimg.com/v2-3f5ddc2367c78d252d1a963843100c1e_r.jpg?source=1940ef5c",width: 60,),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (
                  BuildContext context,
                  animation,
                  secondaryAnimation,
                ) {
                  return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text("Origin Picture"),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                },
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Click the Picture"),
          )
        ],
      ),
    );
  }
}
class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network("https://pic2.zhimg.com/v2-3f5ddc2367c78d252d1a963843100c1e_r.jpg?source=1940ef5c",),
      ),
    );
  }
}