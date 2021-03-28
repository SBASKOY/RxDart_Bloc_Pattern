import 'package:blocpattern/view/counter/counter_state.dart';
import 'package:blocpattern/view/counter/counter_view.dart';
import 'package:blocpattern/view/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CounterState>(create: (c) => new CounterState()),
        Provider<ThemeState>(create: (c) => new ThemeState()),
      ],
      builder: (context, child) {
        final ThemeState state = Provider.of<ThemeState>(context);
        return StreamBuilder(
          stream: state.theme,
          builder: (context, snap) => MaterialApp(
              title: 'Bloc Pattern',
              theme: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light()
                      .copyWith(onSecondary: Colors.black, secondary: Colors.green)),
              darkTheme: ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark()
                      .copyWith(onSecondary: Colors.white, secondary: Colors.amber)),
              themeMode: snap.data,
              home: CounterView()),
        );
      },
    );
  }
}
