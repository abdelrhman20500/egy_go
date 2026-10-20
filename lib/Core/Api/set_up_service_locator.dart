// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:route_ecommerce/Core/function/api_service.dart';
// import 'package:route_ecommerce/Features/Auth/data/repo/auth_repo_impl.dart';
// import 'package:route_ecommerce/Features/cart/data/data_source/cart_remote_data_source.dart';
// import 'package:route_ecommerce/Features/cart/data/repo/cart_repo_impl.dart';
// import 'package:route_ecommerce/Features/home/data/data_source/home_data_source.dart';
// import 'package:route_ecommerce/Features/home/data/repo/home_repo_impl.dart';
//
// import '../../Features/product/data/data_source/product_remote_data_source.dart';
// import '../../Features/product/data/repo/product_repo_impl.dart';
//
// final getIt = GetIt.instance;
//
// void setUpServiceLocator() {
//   getIt.registerSingleton<ApiService>(ApiService(Dio()));
//
//
//   getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService: getIt.get<ApiService>()));
//   getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
//       homeBaseRemoteDataSource:
//           HomeRemoteDataSource(apiService: getIt.get<ApiService>())));
//   getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl(
//       productRemoteDataSource:ProductRemoteDataSource(apiService: getIt.get<ApiService>())));
//   getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(
//       cartRemoteDataSource: CartRemoteDataSource(apiService: getIt.get<ApiService>())));
// }
