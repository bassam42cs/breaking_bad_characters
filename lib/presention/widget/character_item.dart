import 'package:breaking_bad/constants/my_color.dart';
import 'package:flutter/material.dart';

import '../../data/models/character.dart';
class CharacterItem extends StatelessWidget {
  Character character;
  CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColor.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(child: Container(
        color: MyColor.myGrey,
        child: character.image.isNotEmpty?
         FadeInImage.assetNetwork(placeholder:"assets/images/1.gif",
             image: character.image,
         width: double.infinity,
           height: double.infinity,
           fit: BoxFit.cover,
         ):Image.asset("assets/images/2.gif")
      ),
        footer: Container(
          color: Colors.black54,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          alignment: Alignment.bottomCenter,
          child: Text("${character.name}",
          style: TextStyle(
            height: 1.3,
            color: MyColor.myWhite,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
            overflow: TextOverflow.ellipsis,
              maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
