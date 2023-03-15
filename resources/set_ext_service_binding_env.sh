TYPE=_type_
PROVIDER=_provider_
HOST=_host_
PORT=_port_
DATABASE=_database_
USERNAME=_username_
PASSWORD=_password_
envsubst < resources/service-binding-secret.template.taml > resources/service-binding-secret.yaml