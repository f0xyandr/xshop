import 'package:xshop/features/product_list/domain/models/product_list_model.dart';

abstract class ProductListAbstractRepository {
  Future<List<ProductListModel>?> fetchRandomProducts() async {}
}
