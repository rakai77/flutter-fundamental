import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/service/api_service.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';
import 'restauran_list_provider_test.mocks.dart';


@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late RestaurantListProvider restaurantListProvider;
  
  setUp(() {
    mockApiService = MockApiService();
    restaurantListProvider = RestaurantListProvider(mockApiService);
  });
  
  group("RestaurantListProvider Test", () {
    
    test("test initial status provide has been determined", () {
      expect(restaurantListProvider.resultState, isA<RestaurantListNoneState>());
    });

    test('test load data and return empty', () async {
      final emptyResponse = RestaurantListResponse(
        error: false,
        count: 0,
        message: 'success',
        restaurants: [],
      );

      when(mockApiService.getRestaurantList()).thenAnswer((_) async => emptyResponse);

      await restaurantListProvider.fetchRestaurantList();

      expect(restaurantListProvider.resultState, isA<RestaurantListLoadedState>());
      final state = restaurantListProvider.resultState as RestaurantListLoadedState;
      expect(state.data.isEmpty, true);
    });

    test("test load data and return data dummy", () async {
      final dummyResponse = RestaurantListResponse(
        error: false,
        message: 'success',
        count: 1,
        restaurants: [
          Restaurant(id: '1', name: 'Restaurant A', city: 'City A', description: 'Description A', pictureId: '1A', rating: 4.5)
        ],
      );

      when(mockApiService.getRestaurantList()).thenAnswer((_) async => dummyResponse);

      await restaurantListProvider.fetchRestaurantList();

      expect(restaurantListProvider.resultState, isA<RestaurantListLoadedState>());
      final state = restaurantListProvider.resultState as RestaurantListLoadedState;
      expect(state.data.length, 1);
      expect(state.data[0].name, "Restaurant A");
    });
    
    test("test load data and return Error", () async {
      when(mockApiService.getRestaurantList()).thenThrow(Exception('Failed to load data'));

      await restaurantListProvider.fetchRestaurantList();

      expect(restaurantListProvider.resultState, isA<RestaurantListErrorState>());
      final state = restaurantListProvider.resultState as RestaurantListErrorState;
      expect(state.error, 'Exception: Failed to load data');
    });

  });
}