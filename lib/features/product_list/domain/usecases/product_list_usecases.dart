import 'package:xshop/features/product_list/domain/repository/product_list_abstract_repo.dart';

abstract class _ProductListUsecase {
  final ProductListAbstractRepository productRepository;

  _ProductListUsecase({required this.productRepository});

  call();
}

class FetchRandomProductsUseCase implements _ProductListUsecase {
  @override
  // TODO: implement authRepository
  final ProductListAbstractRepository productRepository;

  FetchRandomProductsUseCase({required this.productRepository});

  @override
  call() async {
    return await productRepository.fetchRandomProducts();
  }
}
