import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'App Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print(this._counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        semanticLabel: 'Islands',
        elevation: 16,
        child: ListView(
          controller: ScrollController(
            initialScrollOffset: 2.0,
            keepScrollOffset: true,
          ),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text('Islands Will Be Here'),
            FlatButton(child: Text('Menu Button'),
            color: Colors.amberAccent,
            onPressed: () => {_incrementCounter()},

          ),
          ],

        ),
      ),
      backgroundColor: Color(0x0000000),
     
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true, //false if you want page title to hide when scrolling
            floating: false,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/jaws.png'),
                collapseMode: CollapseMode.parallax,
                title: Text('Primary Page'),
                titlePadding: EdgeInsets.all(25)),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              //nuilds the multiple slivers
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.yellow[100 * (index % 10)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 10,
            ),
          ),
          SliverFillViewport(
            viewportFraction: .25,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    splashColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    color: Colors.purple[100 * (index % 9)],
                    child: Text('Button item $index'),
                    onPressed: () => DemoWidget(),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      )
          // Column(
          //   // Column is also layout widget. It takes a list of children and
          //   // arranges them vertically. By default, it sizes itself to fit its
          //   // children horizontally, and tries to be as tall as its parent.
          //   //
          //   // Invoke "debug painting" (press "p" in the console, choose the
          //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
          //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          //   // to see the wireframe for each widget.
          //   //
          //   // Column has various properties to control how it sizes itself and
          //   // how it positions its children. Here we use mainAxisAlignment to
          //   // center the children vertically; the main axis here is the vertical
          //   // axis because Columns are vertical (the cross axis would be
          //   // horizontal).
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'You have pushed the button this many times:',
          //     ),
          //     Text(
          //       '$_counter',
          //       style: Theme.of(context).textTheme.display1,
          //     ),
          //   ],
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DemoWidget())),
            }, // _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: new AppBar(
        //   elevation: 5.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: Text('Demo Scrolling List '),
        //     collapseMode: CollapseMode.parallax,
        //     background: new Container(
        //       color: Colors.orange,
        //       height: 100,
        //     ),
        //   ),
        //   automaticallyImplyLeading: false,
        //   toolbarOpacity: 1,
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 5.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo Scrolling List '),
            collapseMode: CollapseMode.parallax,
            background: new Container(
              color: Colors.orange,
              height: 100,
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: GridView.builder(
                //this organizes the grid to your liking
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.horizontal,
                //this builds the widgets to occupy the grid
                itemBuilder: (context, index) => new ListViewButtons(),
                itemCount: 20),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //this msets up the grid
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
              //this is what actually builds up each item in the grid
              (context, index) => Container(
                    margin: EdgeInsets.all(5.0),
                    color: Colors.yellow,
                  ),
              childCount: 10),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 600,
            width: double.infinity,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .5,
                
              ),
              itemBuilder: (context, index) =>
                  new GridViewButtons(index: index),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
        )
      ],
    ));
  }
}


// Button builder for bottom scrolling horizontal list on bottom 
class GridViewButtons extends StatelessWidget {
  const GridViewButtons({
    Key key,
    int index,
  }) : super(key: key);
//Got random number generator to work boooyyyaahahhhh!!!!!
  get index => Random().nextInt(12);

  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      color: Colors.tealAccent[100 * (index % 9)],
      child: Text('Button item $index'),
      onPressed: () => DemoWidget(),
    );
  }
}

/// Buttons for horizontal grid view
class ListViewButtons extends StatelessWidget {
  const ListViewButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //Returns you to the previous (home) route
      onPressed: () => Navigator.of(context).pop(),
      child: Container(
        width: 125,
        height: 125,
        color: Colors.orangeAccent,
      ),
    );
  }
}
