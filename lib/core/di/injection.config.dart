// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/modules/books/books_controller.dart' as _i5;
import '../../app/modules/cu_book/controllers/cu_book_controller.dart' as _i4;
import '../../app/services/books_service.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.BooksService>(() => _i3.BooksService());
  gh.factory<_i4.CuBookController>(
      () => _i4.CuBookController(gh<_i3.BooksService>()));
  gh.factory<_i5.BooksController>(
      () => _i5.BooksController(gh<_i3.BooksService>()));
  return getIt;
}
