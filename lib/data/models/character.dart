class Character{
 late  int id;
 late String name;
 late String statusDiedOrlive;
 late String gender;
 late  String speciesHumanOrRebort;
 late String image;

   Character(this.name);
 Character.fromJson(Map<String,dynamic> json){
   id=json["id"];
   name=json["name"];
   statusDiedOrlive=json["status"];
   speciesHumanOrRebort=json["species"];
   gender=json["gender"];
   image=json["image"];
 }

}