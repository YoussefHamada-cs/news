import 'package:get_it/get_it.dart';
import 'package:news/core/api/dio_client.dart';
import 'package:news/features/news/data/repositories/news_repository.dart';
import 'package:news/features/news/presention/cubit/news_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Repositories
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepository(getIt<DioClient>()),
  );

  // Cubits
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt<NewsRepository>()));

  // Add NewsmarkedCubit to service locator if needed
  // getIt.registerSingleton<NewsmarkedCubit>(NewsmarkedCubit());
}
