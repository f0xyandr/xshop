import 'package:xshop/data/datasource/remote/product_remote_control.dart';
import 'package:xshop/domain/models/product_list_model.dart';
import 'package:xshop/domain/models/product_model.dart';
import 'package:xshop/domain/repository/product_abstract_repo.dart';

class ProductAbstractRepositoryImpl implements ProductAbstractRepository {
  ProductRemoteControl dataController;

  ProductAbstractRepositoryImpl({required this.dataController});

  @override
  Future<List<ProductListModel>?> fetchRandomProducts() =>
      dataController.fetchRandomProducts();

  @override
  Future<bool?> addProductToCart({required int productId}) =>
      dataController.addProductToCart(productId: productId);

  @override
  Future<ProductModel?> getProduct({required int productId}) =>
      dataController.getProduct(productId: productId);

  @override
  Future<List<ProductModel?>?> getProductsWithCategory({
    required String categoryId,
  }) => dataController.getProductsWithCategory(categoryId: categoryId);

  @override
  Future<ProductModel?> addProduct() {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>?> getProductsByIds({required List<int> ids}) =>
      dataController.getProductsByIds(ids: ids);
}
