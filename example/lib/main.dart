import 'dart:math';

import 'package:expansion_tile_single_list/expansion_tile_single_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  List<ExpansionItem> get items => [
        const ExpansionItem(
          name: 'Africa',
          subItems: [
            ExpansionSubItem('Nigeria'),
            ExpansionSubItem('Kenya'),
            ExpansionSubItem('Algeria'),
          ],
        ),
        const ExpansionItem(
          name: 'Asia',
          subItems: [
            ExpansionSubItem('China'),
            ExpansionSubItem('India'),
            ExpansionSubItem('Japan'),
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
        const ExpansionItem(
          name: 'North America',
          subItems: [
            ExpansionSubItem('USA'),
            ExpansionSubItem('Canada'),
            ExpansionSubItem('Mexico'),
          ],
        ),
        const ExpansionItem(
          name: 'South America',
          subItems: [
            ExpansionSubItem('Brazil'),
            ExpansionSubItem('Argentina'),
            ExpansionSubItem('Chile'),
          ],
        ),
        const ExpansionItem(
          name: 'Australia',
          subItems: [
            ExpansionSubItem('Australia'),
          ],
        ),
        const ExpansionItem(
          name: 'Antarctica',
          subItems: [], // No countries
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Expansion Tile Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Default Behaviour'),
              DefaultExpansionTile(items: items),
              const SizedBox(
                height: 14,
              ),
              const Text('Workaround'),
              CustomExpansionTile(
                items: items,
              ),
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
