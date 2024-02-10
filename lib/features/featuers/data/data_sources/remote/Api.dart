import '../../../../../core/Api_helper/api.dart';

class GetDataFromApi {
  Future<dynamic> GetPosts() async {
    var response = await ApiHelper().get(
      url: "https://jsonplaceholder.typicode.com/posts",
    );
    print(response);
    return response;
  }
}
