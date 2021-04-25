import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
// import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class Mastermind {
  /*
    Renvoie une chaine de caractères de n nombres aléatoires
   */
  static int Combinaison(n){
    var k = "";
    var random = new Random();
    for( var i = 0 ; i < n; i++ ) {
      var m = random.nextInt(9);
      k += m.toString();
    }
    return int.parse(k);
  }

  /*
    Renvoie le nbr de meme lettres qui sont à la meme place dans test et solution
   */

  static int Places(String test,String solution){
    var n = 0;
    for( var i = 0 ; i < test.length; i++ ) {
      if (test.substring(i,i+1) == solution.substring(i,i+1)) {
        n += 1;
      }
    }
    return n;
  }

  /*
    Renvoie le nbr de fois qu'apparait un nombre
  */

  static List<int> Occurences(String mot) {
    var list = List<int>.filled(10, 0);
    for( var i = 0 ; i < mot.length; i++ ) {
      list[int.parse(mot.substring(i,i+1))] += 1;
    }
    return list;
  }


  /*
    Renvoie le nbr de caractères en commun dans test et solution
  */

  static int Total(String test,String solution){
    List<int> a = Occurences(test);
    List<int> b = Occurences(solution);
    int count = 0;
    for (var i = 0; i < a.length; i++) {
      count += min(a[i],b[i]);
    }
    return count;
  }

  /*
    Renvoie p, le nbr de chiffres en communs mal placés
  */

  static int Compare(String test,String solution) {
    return Total(test,solution)-Places(test,solution);
  }

  @override
  String toString() {
    return "The best mastermind class";
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mastermind',
      initialRoute: '/',
      routes: {
        '/' : (context) => MastermindMenu(),
        '/game' : (context) => MastermindGame(),
        '/game/victory' : (context) => Victory(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      )
    );
  }
}

class MastermindMenu extends StatefulWidget {
  @override
  _MastermindMenuState createState() => _MastermindMenuState();
}

class _MastermindMenuState extends State<MastermindMenu> {

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // First version with just a textField and one submit button
    /*
    return Scaffold(
        appBar: AppBar(
          title: Text('Super Mastermind'),
        ),
        body : new ListView(
          children: <Widget> [
            new ListTile(
              title: new TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Number",
                ),
                keyboardType: TextInputType.number,
                controller: myController,
              )
            ),
            new ListTile(
              title: ElevatedButton (
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(int.parse(myController.text))),
                  );
                  Navigator.of(context).push(route);
                },
                child: Text("Choose"),
              ),
            )
          ],
        )
    );
     */

    return Scaffold(
        appBar: AppBar(
          title: Text('Super Mastermind'),
        ),
        body : GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget> [
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                child: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(1)),
                  );
                  Navigator.of(context).push(route);
                },
              ),
            ),
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                child: Text(
                    "2",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                    ),
                ),
                style: ElevatedButton.styleFrom(
                 primary: Colors.blue,
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(2)),
                  );
                  Navigator.of(context).push(route);
                }
              ),
            ),
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                child: Text(
                    "3",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                    ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(3)),
                  );
                  Navigator.of(context).push(route);
                }
              ),
            ),
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                child: Text(
                    "4",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                    ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(4)),
                  );
                  Navigator.of(context).push(route);
                }
              ),
            ),
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                  child: Text(
                      "5",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                      ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(5)),
                    );
                    Navigator.of(context).push(route);
                  }
              ),
            ),
            Container (
              padding: const EdgeInsets.all(8),
              child: ElevatedButton (
                  child: Text(
                      "6",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30
                      ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new MastermindGame(solution: Mastermind.Combinaison(6)),
                    );
                    Navigator.of(context).push(route);
                  }
              ),
            ),
          ],
        )
    );
  }
}

class MastermindGame extends StatefulWidget {
  final int solution;

  MastermindGame({Key key, this.solution}) : super (key: key);

  @override
  _MastermindGameState createState() => _MastermindGameState();
}

class _MastermindGameState extends State<MastermindGame> {

  String messageText = "";
  var tryCounter = 0;

  void changeMessageText(String newMessage) {
    setState(() {
      messageText = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {

    final userAnswerController = TextEditingController();
    final solutionString = widget.solution.toString();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mastermind the game"),
      ),
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField (
              textAlign: TextAlign.center,
              maxLength: solutionString.length,
              decoration: InputDecoration (
                labelText: "Your guess",
                border: OutlineInputBorder(
                  borderSide: BorderSide (
                    width: 5,
                    color: Colors.black,
                  )
                )
              ),
              keyboardType: TextInputType.number,
              controller: userAnswerController,
            ),
            ElevatedButton (
              onPressed: () {
                if (userAnswerController.text.length > solutionString.length) {
                  changeMessageText("Your answer is too long she must has a length of " + solutionString.length.toString());
                } else if (userAnswerController.text.length < solutionString.length) {
                  changeMessageText("Your answer is too short she must has a length of " + solutionString.length.toString());
                } else {
                  tryCounter ++;
                  int p = Mastermind.Places(userAnswerController.text, solutionString);
                  if (p == widget.solution.toString().length) {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new Victory(tryCounter : tryCounter),
                    );
                    Navigator.of(context).push(route);
                  } else {
                    int misplacedNumber = Mastermind.Compare(userAnswerController.text, solutionString);
                    changeMessageText("You have " + p.toString() + " number well placed and " + misplacedNumber.toString() + " misplaced");
                  }
                }
              },
              child: Text("SEND ANSWER"),
            ),
            Text(
              "$messageText",
            ),
          ],
        )
      ),
    );
  }
}

class Victory extends StatefulWidget {

  final int tryCounter;

  Victory({Key key, this.tryCounter}) : super (key: key);

  @override
  _VictoryState createState() => _VictoryState();
}

class _VictoryState extends State<Victory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Mastermind the game"),
      ),
      body: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Well done"
            ),
            Text(
              "You have take " + widget.tryCounter.toString() + " try to win"
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton (
                child: Text(
                    "Play again"
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



/*
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context){
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
          pair.asPascalCase,
          style: _biggerFont
      ),
      onTap: () {
        debugPrint('prout:$pair');
      },
    );
  }
}
 */

/*
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
 */

/*
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("CHOOSE"),
              )
            ],
          ),
      ),
      
      /*Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _
          ],
        ),
      ), */
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/