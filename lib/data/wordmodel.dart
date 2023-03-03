// @dart=2.9

class wordmodel {
  int id;
  String Eword;
  String Aword;
wordmodel(this.Eword,this.Aword);
  // wordmodel( this.Eword, this.Aword);

  Map<String, dynamic> toMap() {
    // return{'id': id,'Eword': Eword,'Aword':Aword};



    var map = Map<String, dynamic>();
    map={"id":this.id,"Eword":this.Eword,"Aword":this.Aword};

    return map;
  }

  // Map<String, dynamic> _testMap = {
  //   "val1": 'value 1',
  //   "val2": 2,
  //   "val3": {"a": "another value"}
  // };
  wordmodel.fromMap(Map<String,dynamic>   map) {
    id = map['id'];
    Eword = map['Eword'];
    Aword = map['Aword'];
  }





}
// wordmodel mywrdmdl=new wordmodel();
// Map  mdlmap = mywrdmdl.toMap();
//-----------------------------------------------------------------------------------------------------------
// class word_model{
//   int id;
//   String  Eword ;
//   String  Aword ;
//
//
//
//   word_model(this.id,this.Eword ,this.Aword );
//   word_model.map(dynamic obj){
//     this.id = obj['id'];
//
//     this.Eword = obj['Eword'];
//     this.Aword = obj['Aword'];
//
//   }
//   int get _id => id;
//
//   String get _Eword => Eword;
//   String get _Aword => Aword;
//
//
//   Map<String , dynamic> toMap(){
//     var map = new Map<String , dynamic>();
//     if(id != null){
//       map['id'] = _id;
//     }
//     map['Eword'] = _Eword;
//     map['Aword'] = _Aword;
//
//
//     return map;
//   }
//
//   word_model.fromMap(Map<String , dynamic>map){
//     this.id = map['id'];
//     this.Eword = map['Eword'];
//     this.Aword = map['Aword'];
//
//
//   }
//
// }