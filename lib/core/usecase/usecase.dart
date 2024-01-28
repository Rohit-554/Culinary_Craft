/* Genric use case for future methods */

abstract class UseCase<Type,Params> {
  Future<Type> call({Params params});
}