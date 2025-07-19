import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../di/dependencies.dart';
import '../../../domain/use_cases/load_address_use_case.dart';

class CustomerDetailsCubitProvider extends BlocProvider<CustomerDetailsCubit> {
  CustomerDetailsCubitProvider({
    super.key,
    super.child,
    Create<CustomerDetailsCubit>? create,
    LoadAddressUseCase? useCase,
  }) : super(
         create:
             create ??
             (context) =>
                 CustomerDetailsCubit(loadAddressUseCase: di())..init(),
       );

  static CustomerDetailsCubit of(BuildContext context) =>
      BlocProvider.of<CustomerDetailsCubit>(context);
}

class CustomerDetailsCubit extends Cubit<CustomerDetailsState> {
  CustomerDetailsCubit({required this.loadAddressUseCase})
    : super(const CustomerDetailsState());

  final LoadAddressUseCase loadAddressUseCase;

  Future<void> init() async {
    await loadAddressUseCase
        .call()
        .then((value) => _emit(address: value))
        .catchError((error) => _emit(error: error));
  }

  void onChangeName(String name) {
    _emit(name: name);
  }

  void onChangeAddress(String address) {
    _emit(address: address);
  }

  void _emit({String? name, String? address, Object? error}) =>
      emit(state.copyWith(name: name, address: address, error: error));
}

class CustomerDetailsState extends Equatable {
  const CustomerDetailsState({this.name, this.address, this.error});

  final String? name;
  final String? address;
  final Object? error;

  bool get submitEnabled =>
      (name?.trim().isNotEmpty ?? false) &&
      (address?.trim().isNotEmpty ?? false);

  CustomerDetailsState copyWith({
    String? name,
    String? address,
    Object? error,
  }) => CustomerDetailsState(
    name: name ?? this.name,
    address: address ?? this.address,
    error: error ?? this.error,
  );

  @override
  List<Object?> get props => [name, address, error];
}
