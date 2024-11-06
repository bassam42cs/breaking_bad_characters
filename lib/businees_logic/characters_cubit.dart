import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/models/character.dart';
import 'package:breaking_bad/data/repositry/character_repositry.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

   List<Character> characters =[];
  CharacterRepository characterRepository;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> retrivAllCharacters(){
    characterRepository.fetchAllCharacters().then((characters){
      emit(CharactersLoaded(characters));
     this.characters=characters;

    });
       return characters;
}
}
