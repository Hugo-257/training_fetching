import 'package:training_fetching/logic/models/joke_model.dart';
import 'package:training_fetching/logic/resources/api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  Future<Joke> fetchJoke() {
    return _apiProvider.fetchData();
  }
}
