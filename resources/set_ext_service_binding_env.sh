TYPE=MYTYPE
PROVIDER=MYPROVIDER
HOST=MYHOST
PORT=MYPORT
DATABASE=MYDATABASE
USERNAME=MYUSERNAME
PASSWORD=MYPASSWORD
envsubst < resources/service-binding-secret.template.taml > resources/service-binding-secret.yaml