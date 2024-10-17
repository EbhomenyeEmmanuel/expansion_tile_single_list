<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

The package displays one ExpansionPanelList at a time in a list of ExpansionPanels.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart 
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<ExpansionItem> get items =>
      [
        const ExpansionItem(
          name: 'Africa',
          subItems: [
            ExpansionSubItem('Nigeria'),
            ExpansionSubItem('Kenya'),
            ExpansionSubItem('Algeria'),
          ],
        ),
        const ExpansionItem(
          name: 'Europe',
          subItems: [
            ExpansionSubItem('Germany'),
            ExpansionSubItem('France'),
            ExpansionSubItem('Spain'),
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('Expansion Tile Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 14,
              ),
              CustomExpansionTile(items: items),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
