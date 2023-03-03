import 'package:flutter/material.dart';

class charcter extends StatefulWidget{
  charcter();
  @override

  _charcter createState() => _charcter();

}
class _charcter extends State<charcter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("welcome"),
        ),
        body: _ListViewBldr(context) //FlareActor('assets/button-animation.flr')
    );
  }
}

ListView _ListViewBldr(BuildContext context){
  return ListView.builder(
      itemCount:10 ,
      itemBuilder: (_,index){

        return Card( child:


        ListTile(
            title: Text('it1'),
            subtitle: Text('subttl'),
            leading:Icon(Icons.thumb_up) ,
            trailing: IconButton( icon:Icon(Icons.arrow_forward),
              onPressed: (){
              // Navigator.push( context, MaterialPageRoute(builder: (context)=>Details(index)
              // ),
              // );
              },
            )
        ));
      }
  );
}