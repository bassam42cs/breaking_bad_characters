 import 'package:breaking_bad/businees_logic/characters_cubit.dart';
import 'package:breaking_bad/data/repositry/character_repositry.dart';
import 'package:breaking_bad/data/web_services/characters_web_services.dart';
import 'package:breaking_bad/presention/screens/character_details.dart';
import 'package:breaking_bad/presention/screens/charaters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
class AppRoutes {
    late CharactersCubit  characterscubit;
    late CharacterRepository characterRepository;

   AppRoutes(){
     characterRepository=CharacterRepository(CharactersWebServices());
     characterscubit=CharactersCubit(characterRepository);


   }

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_)=>BlocProvider(
                 create: ( BuildContext context)=>CharactersCubit(characterRepository),
                 child: const CharatersScreen(),

    ),


    );



      case characterDetails:
        return MaterialPageRoute(builder: (_)=> const CharacterDetails());
    }

  }
}