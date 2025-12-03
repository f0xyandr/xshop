import 'package:xshop/features/product_list/data/remote_control/product_list_remote_control.dart';
import 'package:xshop/features/product_list/domain/models/product_list_model.dart';
import 'package:xshop/features/product_list/domain/repository/product_list_abstract_repo.dart';

class ProductListAbstractRepositoryImpl
    implements ProductListAbstractRepository {
  ProductListRemoteControl dataController;

  ProductListAbstractRepositoryImpl({required this.dataController});

  @override
  Future<List<ProductListModel>?> fetchRandomProducts() async =>
      await dataController.fetchRandomProducts();
}
