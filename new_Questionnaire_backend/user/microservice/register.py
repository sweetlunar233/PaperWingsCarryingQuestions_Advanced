import consul, random

#ServiceInstance类:注册服务所需信息
class ServiceInstance:

    def __init__(self, service_id: str, host: str, port: int, secure: bool = False, metadata: dict = None,
                 instance_id: str = None):
        self.service_id = service_id
        self.host = host
        self.port = port
        self.secure = secure
        self.metadata = metadata
        self.instance_id = instance_id

    def get_instance_id(self):
        return
    

import abc

class ServiceRegistry(abc.ABC):

    @abc.abstractmethod
    def register(self, service_instance: ServiceInstance):
        pass

    @abc.abstractmethod
    def deregister(self):
        pass


class ConsulServiceRegistry(ServiceRegistry):
    _consul = None
    _instance_id = None

    def __init__(self, host: str, port: int, token: str = None):
        self.host = host
        self.port = port
        self.token = token
        self._consul = consul.Consul(host, port, token=token)

    def register(self, service_instance: ServiceInstance):
        schema = "http"
        if service_instance.secure:
            schema = "https"
        check = consul.Check.http(f"{schema}://{service_instance.host}:{service_instance.port}/health", 
                                  "1s", "3s", "10s")
        self._consul.agent.service.register(service_instance.service_id,
                                            service_id=service_instance.instance_id,
                                            address=service_instance.host,
                                            port=service_instance.port,
                                            check=check)
        self._instance_id = service_instance.instance_id

    def deregister(self):
        if self._instance_id:
            self._consul.agent.service.deregister(service_id=self._instance_id)
            self._instance_id = None


if __name__=='__main__':
    print('***')
    instance = ServiceInstance('user','127.0.0.1',8000,instance_id=f'user_{int(random.random() * 1000000)}')
    registry = ConsulServiceRegistry("127.0.0.1", 8500)
    registry.register(instance)
    print('***')
