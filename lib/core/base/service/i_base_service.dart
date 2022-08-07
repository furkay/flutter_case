import '../../network/i_network_manager.dart';

abstract class IBaseService {
  final INetworkManager networkManager;
  const IBaseService(this.networkManager);
}
