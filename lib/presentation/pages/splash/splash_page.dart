import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_info.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'splash page',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.push(RouteInfo.home.path),
              child: Text('move home'),
            ),
          ],
        ),
      ),
    );
  }
}
