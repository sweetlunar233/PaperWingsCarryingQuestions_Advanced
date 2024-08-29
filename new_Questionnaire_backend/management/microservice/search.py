#服务发现
import abc, consul
from register import ServiceInstance

class DiscoveryClient(abc.ABC):

    @abc.abstractmethod
    def get_services(self) -> list:
        pass

    @abc.abstractmethod
    def get_instances(self, service_id: str) -> list:
        pass


class ConsulServiceDiscovery(DiscoveryClient):

    _consul = None

    def __init__(self, host: str, port: int, token: str = None):
        self.host = host
        self.port = port
        self.token = token
        self._consul = consul.Consul(host, port, token=token)

    def get_services(self) -> list:
        return self._consul.catalog.services()[1].keys()

    def get_instances(self, service_id: str) -> list:
        origin_instances = self._consul.catalog.service(service_id)[1]
        result = []
        for oi in origin_instances:
            result.append(ServiceInstance(
                oi.get('ServiceName'),
                oi.get('ServiceAddress'),
                oi.get('ServicePort'),
                oi.get('ServiceTags'),
                oi.get('ServiceMeta'),
                oi.get('ServiceID'),
            ))
        return result

if __name__=='__main__':
    # print('---')
    discovery = ConsulServiceDiscovery("127.0.0.1", 8500)
    # print(discovery.get_services())
    # print(discovery.get_instances("user"))
    # print('---')