part of 'car_data.dart';

class CarService {
  final String baseUrl = 'http://10.0.2.2:8080/api/cars';

  Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Car.fromJson(json)).toList();
    } else {
      print('Failed to load cars: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load cars');
    }
  }
}
