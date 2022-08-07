import 'i_base_service.dart';

abstract class IBaseRepository {
  final IBaseService service;
  const IBaseRepository(this.service);
}
