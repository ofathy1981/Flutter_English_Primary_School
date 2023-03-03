// @dart=2.9

import 'package:flutter/material.dart';
import 'data/dbmanager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    onPressed: () {

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
}