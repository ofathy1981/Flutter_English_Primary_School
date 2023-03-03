// @dart=2.9
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_tree/flutter_tree.dart';
import 'package:primary_secondery_english/data/wordmodel.dart';
import 'package:primary_secondery_english/data/DBHelper.dart';
import 'package:primary_secondery_english/data/dbmanager.dart';
List mywords;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var db = new DbWordManager();
  db.openDb();

  // await db.save( new wordmodel('book','كتاب'));
  // mywords = await db.getWORDS();
  print("this is sqllite");
  // print(mywords.first);
  io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String query = "SELECT * FROM word";
  // final List<Map<String, dynamic>> maps = await db.rawQuery(query);

  print(documentsDirectory.path);
  runApp(MyApp());

  // word_model wrd_mdl=new word_model("de1", "def2")
  for(int i =0 ; i < mywords.length;i++) {
    //   word_model Word_model = word_model.fromMap(mywords[i]) ;
    //   print('ID: ${Word_model.id} - username: ${Word_model.Eword} - city: ${Word_model.Aword}');
    // mywords
    // print(mywords.first);
  }
    //
  // }

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
//===============================================================================================================
class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        title: Text('English Helper For Students'),
      ),
      body: Center(

        child:Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: ListView(
       children: [Center(child: Text("WELCOME",style: new TextStyle(color: Colors.pink,fontSize: 50))),Padding(
             padding: const EdgeInsets.all(15.0),
             child: Image.asset('images/home.jpg',width: 130,height: 160,),
       ),],
            ),
          ),
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//*****************************************************************************************************************

// ***********************************************Words******************************************************************
class MyHomePage2 extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        title: Text('English Helper For Students'),
      ),
      body: Center(

        child:ListView(

          children: [Icon(Icons.apps_rounded),Center(child: Text("WORDS",style: new TextStyle(color: Colors.pink,fontSize: 50))),Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(child: itemcard("A",Colors.red),onTap: () => {              Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new verbs())
                  )}),
                  itemcard("D",Colors.blue),
                  itemcard("G",Colors.lightGreen),

                ],
              ), Column(
                children: [
                  itemcard("B",Colors.blue),
                  itemcard("E",Colors.red),
                  itemcard("H",Colors.deepPurpleAccent),

                ],
              ),
              Column(
                children: [
                  itemcard("C",Colors.red),
                  itemcard("F",Colors.blue),
                  itemcard("I",Colors.lightGreen),

                ],
              )


            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    itemcard("J",Colors.deepPurpleAccent),
                    itemcard("M",Colors. purple),
                    itemcard("P",Colors.teal),

                  ],
                ), Column(
                  children: [
                    itemcard("k",Colors.lightGreen),
                    itemcard("N",Colors.teal),
                    itemcard("Q",Colors.purple),

                  ],
                ),
                Column(
                  children: [
                    itemcard("L",Colors.deepPurpleAccent),
                    itemcard("O",Colors.purple),
                    itemcard("R",Colors.teal),

                  ],
                ),


              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    itemcard("S",Colors.indigo),
                    itemcard("V",Colors.red),
                    itemcard("Y",Colors.red),

                  ],
                ), Column(
                  children: [
                    itemcard("T",Colors.red),
                    itemcard("W",Colors.indigo),
                    itemcard(" ",Colors.white),

                  ],
                ),
                Column(
                  children: [
                    itemcard("U",Colors.indigo),
                    itemcard("X",Colors.red),
                    itemcard("Z",Colors.red),

                  ],
                ),


              ],
            )

        ]),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


Color bclr=bclr;

  Widget itemcard( String chr,Color  bclr) {
      return Center(
        child: Card(
      color: Colors.blue,          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            // onTap: () {
            //   print('Card tapped.');
            // },
            child: Container(
              color: bclr ,
              child: Center(

                child:  SizedBox(

                  width: 80,
                  height: 80,
                  child: Center(child: Text(chr ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),textAlign: TextAlign.center,)),
                ),
              ),
            ),
          ),
        ),
      );
    }
 //=============================================Verbs==============================================================================================
class verbs extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _verbs createState() => _verbs();

}

class _verbs extends State<verbs> {
  void _submitStudent(BuildContext context) {
    if(_formKey.currentState.validate()){
      if(word==null) {
        Words st = new Words(engword: _engwordController.text, arword: _arwordController.text);
        dbmanager.insertWord(st).then((id)=>{
          _engwordController.clear(),
          _arwordController.clear(),
          print('Student Added to Db ${id}')
        });
      } else {
        word.arword = _engwordController.text;
        word.engword = _arwordController.text;

        dbmanager.updateWord(word).then((id) =>{
          setState((){
            studlist[updateIndex].engword = _engwordController.text;
            studlist[updateIndex].arword= _arwordController.text;
          }),
          _engwordController.clear(),
          _arwordController.clear(),
          word=null
        });
      }
    }
  }



  final DbWordManager dbmanager = new DbWordManager();

  final _engwordController = TextEditingController();
  final _arwordController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Words word;
  List<Words> studlist;
  int updateIndex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Demo'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Name'),
                    controller: _engwordController,
                    validator: (val) =>
                    val.isNotEmpty ? null : 'Name Should Not Be empty',
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: 'Course'),
                    controller: _arwordController,
                    validator: (val) =>
                    val.isNotEmpty ? null : 'Course Should Not Be empty',
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    child: Container(
                        width: width * 0.9,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () { _submitStudent(context);

                    },
                  ),
                  FutureBuilder(
                    future: dbmanager.getWordList(),
                    builder: (context,snapshot){
                      if(snapshot.hasData) {
                        studlist = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: studlist == null ?0 : studlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            Words st = studlist[index];
                            return Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width*0.6,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Name: ${st.engword}',style: TextStyle(fontSize: 15),),
                                        Text('Course: ${st.arword}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                                      ],
                                    ),
                                  ),

                                  IconButton(onPressed: (){
                                    _engwordController.text=st.engword;
                                    _arwordController.text=st.arword;
                                    word=st;
                                    updateIndex = index;
                                  }, icon: Icon(Icons.edit, color: Colors.blueAccent,),),
                                  IconButton(onPressed: (){
                                    dbmanager.deleteWord(st.id);
                                    setState(() {
                                      studlist.removeAt(index);
                                    });
                                  }, icon: Icon(Icons.delete, color: Colors.red,),)

                                ],
                              ),
                            );
                          },

                        );
                      }
                      return new CircularProgressIndicator();
                    },
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }















}
//*****************************************************************************************************************
//*************************************************************************************************************************************************
class expressions extends StatefulWidget {
  @override
  _expressions createState() => _expressions();
}

class _expressions extends State<expressions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            title: Text('All Common Expressions'),
          ),
          body: ListView(children: <Widget>[
            Icon(Icons.exit_to_app),Center(child: Text("Exp",style: new TextStyle(color: Colors.pink,fontSize: 50))),
            Center(
                child: Text(
                  'Expressions List',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(label: Text(
                    'Expression',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Meaning',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),

              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),

                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('John')),

                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Harry')),

                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),

                ]),
              ],
            ),
          ])
      ),
    );
  }
}

//============================================================================================================================================
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'App Contents',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => new MyHomePage())
            )},
          ),
          ListTile(
            leading: Icon(Icons.apps_rounded),
            title: Text('words'),

            onTap: () => {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new MyHomePage2())
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Verbs'),
            onTap: () => {              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => new verbs())
            )},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Expressions'),
            onTap: () => {Navigator.push(context, new MaterialPageRoute(
                builder: (context) => new expressions())
            )},
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('About Yosef And Noura'),
            onTap: () => {Navigator.of(context).pop()},
          )
        ],
      ),
    );
  }
}
//------------------------------------------------------------------------------------------------------------------------------------------
class MyHomePage3 extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState3 createState() => _MyHomePageState3();
}



class _MyHomePageState3 extends State<MyHomePage3> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        title: Text('English Helper For Students'),
      ),
      body: Center(

        child:ListView(

            children: [Icon(Icons.apps_rounded),Center(child: Text("WORDS",style: new TextStyle(color: Colors.pink,fontSize: 50))),Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
    GestureDetector(
    onTap: () {
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => new verbs())
      );



    },child: itemcard("A",Colors.red)),
                    itemcard("D",Colors.blue),
                    itemcard("G",Colors.lightGreen),

                  ],
                ), Column(
                  children: [
                    itemcard("B",Colors.blue),
                    itemcard("E",Colors.red),
                    itemcard("H",Colors.deepPurpleAccent),

                  ],
                ),
                Column(
                  children: [
                    itemcard("C",Colors.red),
                    itemcard("F",Colors.blue),
                    itemcard("I",Colors.lightGreen),

                  ],
                )


              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      itemcard("J",Colors.deepPurpleAccent),
                      itemcard("M",Colors. purple),
                      itemcard("P",Colors.teal),

                    ],
                  ), Column(
                    children: [
                      itemcard("k",Colors.lightGreen),
                      itemcard("N",Colors.teal),
                      itemcard("Q",Colors.purple),

                    ],
                  ),
                  Column(
                    children: [
                      itemcard("L",Colors.deepPurpleAccent),
                      itemcard("O",Colors.purple),
                      itemcard("R",Colors.teal),

                    ],
                  ),


                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      itemcard("S",Colors.indigo),
                      itemcard("V",Colors.red),
                      itemcard("Y",Colors.red),

                    ],
                  ), Column(
                    children: [
                      itemcard("T",Colors.red),
                      itemcard("W",Colors.indigo),
                      itemcard(" ",Colors.white),

                    ],
                  ),
                  Column(
                    children: [
                      itemcard("U",Colors.indigo),
                      itemcard("X",Colors.red),
                      itemcard("Z",Colors.red),

                    ],
                  ),


                ],
              )

            ]),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}