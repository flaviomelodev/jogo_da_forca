import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

//Estado atual em relação à visibilidade do Drawer
class DrawerTooglePressed extends DrawerState {
  final bool isOpen;

  const DrawerTooglePressed({required this.isOpen});

  @override
  List<Object> get props => [isOpen];
}

//Evento de alternância no estado de visibilidade
class ToogleDrawer extends DrawerEvent {
  final bool isOpen;

  const ToogleDrawer({required this.isOpen});

  @override
  List<Object> get props => [isOpen];
}

class DrawerBloc extends Bloc<DrawerEvent, DrawerTooglePressed> {
  DrawerBloc() : super(const DrawerTooglePressed(isOpen: false)) {
    on<ToogleDrawer>(
        (event, emit) => emit(DrawerTooglePressed(isOpen: !event.isOpen)));
  }
}
