import 'package:bloc/bloc.dart';
import 'package:ebook/Repository/Api/Ebook_Api.dart';
import 'package:ebook/Repository/ModelClass/EbookModel.dart';
import 'package:meta/meta.dart';

part 'ebook_event.dart';
part 'ebook_state.dart';

class EbookBloc extends Bloc<EbookEvent, EbookState> {
late  List<EbookModel> ebookModel;
EbookApi ebookApi =EbookApi();
  EbookBloc() : super(EbookInitial()) {
    on<FeatchEbook>((event, emit) async{
      emit(EbookBlocLoading());

      try{ebookModel =await ebookApi.getinsta();
      emit(EbookBlocLoaded());
      }
          catch(a){
        emit(EbookBlocError());
        print(a);
          }

    });
  }
}
