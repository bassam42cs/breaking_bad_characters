import 'package:breaking_bad/data/web_services/characters_web_services.dart';
import '../models/character.dart';

class CharacterRepository {
  final CharactersWebServices charactersWebServices;

  CharacterRepository(this.charactersWebServices);

  Future<List<Character>> fetchAllCharacters() async {
    final charactersJson = await charactersWebServices.getAllCharacters();
    return charactersJson.map<Character>((character) => Character.fromJson(character)).toList();

  }
}
