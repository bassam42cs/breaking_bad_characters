import 'package:breaking_bad/businees_logic/characters_cubit.dart';
import 'package:breaking_bad/constants/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/character.dart';
import '../widget/character_item.dart';

class CharatersScreen extends StatefulWidget {

  const CharatersScreen({super.key});

  @override
  State<CharatersScreen> createState() => _CharatersScreenState();
}

class _CharatersScreenState extends State<CharatersScreen> with SingleTickerProviderStateMixin {
   late List<Character> allCharacters;
   List<Character> dummyCharacters = [
     Character( "Character 1"),
     Character( "Character 2"),
     Character( "Character 3"),
   ];


  @override
  void initState() {
    super.initState();
     BlocProvider.of<CharactersCubit>(context).retrivAllCharacters();

  }
  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context,state){
         if(state is CharactersLoaded){
           allCharacters=(state).characters;
           return BuildLoadedListWidget();
         }else{
           return Center(
             child: CircularProgressIndicator(
               color: MyColor.myYellow,
             ),
           );

         }
        }

        );
  }
  Widget BuildLoadedListWidget(){
    return Container(
      color: MyColor.myGrey,
      child:buildCharactersList(),
    );
  }

    Widget buildCharactersList(){
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                   childAspectRatio: 2/3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
      ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: dummyCharacters.length,
      itemBuilder: (context ,index){
        return CharacterItem(character: dummyCharacters[index],);
      },

    );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.myYellow,
        title: Text("chacaters ",
        style: TextStyle(
          color: MyColor.myGrey,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body:  buildBlocWidget(),

    );
  }
}

