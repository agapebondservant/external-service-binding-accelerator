export TYPE=MYTYPE
export PROVIDER=MYPROVIDER
export HOST=MYHOST
export PORT=MYPORT
export DATABASE=MYDATABASE
export USERNAME=MYUSERNAME
export PASSWORD=MYPASSWORD
envsubst < resources/service-binding-secret.template.yaml > resources/service-binding-secret.yaml
kubectl apply -f resources/stk-secret-reader.yaml -n MYNAMESPACE
ytt -f resources/service-binding-secret.yaml -f service-claim.yaml -n MYNAMESPACE
kubectl get resourceclaim MYCLAIM -n MYNAMESPACE