import 'package:blocpattern/view/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  final ThemeState state = Provider.of<ThemeState>(context, listen: false);
                  state.changeTheme(ThemeMode.dark);
                },
                child: Text("Siyah Tema")),
            TextButton(
                onPressed: () {
                  final ThemeState state = Provider.of<ThemeState>(context, listen: false);
                  state.changeTheme(ThemeMode.light);
                },
                child: Text("Beyaz Tema"))
          ],
        ),
      ),
    );
  }
}
