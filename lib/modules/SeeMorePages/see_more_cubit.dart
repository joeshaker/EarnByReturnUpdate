import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  SeeMoreCubit() : super(SeeMoreInitial());

}
