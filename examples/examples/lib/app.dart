import 'package:examples/src/basic.dart';
import 'package:flutter/material.dart';
import 'package:koin/koin.dart';

import 'src/scope_provider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplesPage(),
    );
  }
}

class ExamplesPage extends StatefulWidget {
  @override
  _ExamplesPageState createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage> {
  @override
  void initState() {
    super.initState();
    startKoin((app) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Examples"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExampleButton(
                exampleName: 'Basic Counter',
                page: CounterPage(),
                modules: [basiModule],
              ),
              ExampleButton(
                exampleName: 'Scope Provider',
                page: FirstPage(),
                modules: [scopeProviderModule],
              ),
            ],
          ),
        ));
  }
}

class ExampleButton extends StatefulWidget {
  final Widget page;
  final String exampleName;
  final List<Module> modules;

  const ExampleButton(
      {Key key,
      @required this.page,
      @required this.exampleName,
      @required this.modules})
      : super(key: key);

  @override
  _ExampleButtonState createState() => _ExampleButtonState();
}

class _ExampleButtonState extends State<ExampleButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.grey,
      onPressed: () async {
        loadKoinModules(widget.modules);

        await Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return widget.page;
        }));

        unloadKoinModules(widget.modules);
      },
      child: Text(widget.exampleName),
    );
  }
}
