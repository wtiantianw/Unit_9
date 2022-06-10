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
        body: AnimatedSwitcherCounterRoute(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
class AnimatedSwitcherCounterRoute extends StatefulWidget {
   const AnimatedSwitcherCounterRoute({Key?key}) : super(key: key);

   @override
   _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
 }
 class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
   int _count = 0;

   @override
   Widget build(BuildContext context) {
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           AnimatedSwitcher(
             duration: const Duration(milliseconds: 500),
             transitionBuilder: (Widget child, Animation<double> animation) {
               //执行缩放动画
               return ScaleTransition(child: child, scale: animation);
             },
             child: Text(
               '$_count',
               //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
               key: ValueKey<int>(_count),
               style: Theme.of(context).textTheme.headline4,
             ),
           ),
           ElevatedButton(
             child: const Text('+1',),
             onPressed: () {
               setState(() {
                 _count += 1;
               });
             },
           ),
         ],
       ),
     );
   }
 }

