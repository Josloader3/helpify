import 'package:helpify/src/models/publicacion_model.dart';
import 'package:helpify/src/providers/publicaciones_provider.dart';
import 'package:rxdart/rxdart.dart';

class PublicacionesBloc{

  final _publicacionesProvider = new PublicacionesProvider();
  final _publicacionesController = new BehaviorSubject<List<Publicacion>>();

  Stream<List<Publicacion>> get publicacionesStream => _publicacionesController.stream;

  void dispose(){
    _publicacionesController?.close();
  }

  loadPublicaciones() async{
    final publicaciones = await _publicacionesProvider.getPublicaciones();
    _publicacionesController.sink.add(publicaciones);
  }
}