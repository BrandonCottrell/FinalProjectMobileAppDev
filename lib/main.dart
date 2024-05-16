import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});


  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}



class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  bool isDark = false;
  static final _breweryTextController = TextEditingController();
  static final _beerTextController = TextEditingController();
  static List<String> Breweries = ['Raised Grain', 'Eagle Park', 'North Pillar', 'MobCraft'];
  List<String> Beer = ['IPA', 'Lager', 'Porter'];


  // void _addBeer(String newBeer) {
  //   setState(() {
  //     Beer.add(newBeer);
  //   });
  // }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final List<Widget> _widgetOptions = <Widget>[
    // Home Page
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder:
          (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(4, (int index) {
          final String item = 'Brewery ${index + 1 }';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    ),

    // My Breweries Page
    Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Breweries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card (
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(Breweries[index]),
                    onTap: () {
                      // handle item click
                      print('Item ${index + 1 } clicked!');
                      },
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _breweryTextController,
            decoration: InputDecoration(
                hintText: 'Add Brewery',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _breweryTextController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Breweries.add(_breweryTextController.text);
              setState((){});
              _breweryTextController.clear();
              print('Add new brewery clicked!');
              print(_breweryTextController.text);
              print(Breweries);

            },
            child: Text('Add New Brewery'),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow[800]!),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.green[900]!)// Change button color
              )
          ),
        ],
      ),
    ),

    // My Beer Page
    Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Beer.length,
              itemBuilder: (BuildContext context, int index) {
                return Card (
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(Beer[index]),
                    onTap: () {
                      // handle item click
                      print('Item ${index + 1 } clicked!');
                    },
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _beerTextController,
            decoration: InputDecoration(
              hintText: 'Add Beer',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  _beerTextController.clear();
                },
                icon: const Icon(Icons.clear),
              )
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Beer.add(_beerTextController.text);
              setState((){});
              _beerTextController.clear();
              print('Add new beer clicked!');
              print(_beerTextController.text);
              print(Beer);

            },
            child: Text('Add New Beer'),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow[800]!),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.green[900]!)// Change button color
            ),
          ),
        ],
      ),
    ),

    // Profile Page
    Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // background image and bottom contents
        Column(
          children: <Widget>[
            Container(
              height: 200.0,
              color: Colors.yellow[800],
              child: Center(
                child: Text('Welcome, Bob',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 150.0),
                color: Colors.white12,
                child: ListView(
                  children: const <Widget>[
                    ListTile(
                      title: Text('Name'),
                      subtitle: Text('Bob Smith'),
                      trailing: Icon(Icons.edit),
                    ),
                    Divider(height: 0),
                    ListTile(
                      title: Text('Location'),
                      subtitle: Text(
                          'Pewaukee, WI'),
                      trailing: Icon(Icons.edit),
                    ),
                    Divider(height: 0),
                    ListTile(
                      title: Text('Favorite Brewery'),
                      subtitle: Text(
                          "Eagle Park"),
                      trailing: Icon(Icons.edit),
                    ),
                    Divider(height: 0),
                  ],
                ),
              ),
            )
          ],
        ),
        // Profile image
        Positioned(
          top: 125.0, // (background container size) - (circle height / 2)
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[900],
            ),
          ),
        )
      ],
    )



  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onHomeTapped(int index) {
    setState(() {
      _selectedIndex = 0;
    });
  }



  void _onProfileTapped(int index) {
    setState(() {
      _selectedIndex = 3;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home, size: 40, color: Colors.green[900],),
          tooltip: 'Go Home',
          onPressed: () {
            _onHomeTapped(1);
          },
        ),
        centerTitle: true,
        title: const Text('Brewery App', style: TextStyle(fontSize: 30)),
          actions: [
            IconButton(
              icon: Icon(Icons.person, size: 40, color: Colors.green[900],),
              tooltip: 'Open Account',
              onPressed: () {
                _onProfileTapped(3);
              },
            )
          ]
      ),


      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green[900],),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin, color: Colors.green[900],),
            label: 'My Breweries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_bar_rounded, color: Colors.green[900],),
            label: 'My Beer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green[900],),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[800],
        onTap: _onItemTapped,
      ),
    );
  }
}