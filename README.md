# expansion_tile_single_list

## Features

The package displays one ExpansionPanelList at a time in a list of ExpansionPanels.

## Getting started

To use this package, add it as a Git dependency in your project
```yaml 
dependencies:
  expansion_tile_single_list:
    git:
      url: https://github.com/EbhomenyeEmmanuel/expansion_tile_single_list.git
```

## Usage

```dart 
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

//Create a list of ExpansionItem objects
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
              const Text('Default Behaviour'),
              DefaultExpansionTile(items: items),
              const SizedBox(
                height: 14,
              ),
              const Text('Workaround'),
              CustomExpansionTile(items: items),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

https://github.com/user-attachments/assets/96bf60a5-8ac3-49d4-b903-4a2fc4a983cc


## Additional information

Contributions and suggestions are highly welcome.
