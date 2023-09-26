import 'package:bloc/bloc.dart';
import 'package:flutter_seller_fic7_app_rudis/data/datasources/category_remote_datasource.dart';
import 'package:flutter_seller_fic7_app_rudis/data/models/categories_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const _Initial()) {
    on<_GetCategories>((event, emit) async {
      emit(const _Loading());
      final response = await CategoryRemoteDatasource().getCategories();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
