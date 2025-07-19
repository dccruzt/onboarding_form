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

  void _emit({String? address, Object? error}) =>
      emit(state.copyWith(address: address, error: error));
}

class CustomerDetailsState extends Equatable {
  const CustomerDetailsState({this.address, this.error});

  final String? address;
  final Object? error;

  CustomerDetailsState copyWith({String? address, Object? error}) =>
      CustomerDetailsState(
        address: address ?? this.address,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [address, error];
}
