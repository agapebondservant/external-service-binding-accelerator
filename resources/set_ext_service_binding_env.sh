export TYPE=MYTYPE
export PROVIDER=MYPROVIDER
export HOST=MYHOST
export PORT=MYPORT
export DATABASE=MYDATABASE
export USERNAME=MYUSERNAME
export PASSWORD=MYPASSWORD
envsubst < resources/service-binding-secret.template.yaml > resources/service-binding-secret.yaml
kubectl apply -f resources/stk-secret-reader.yaml -n MYNAMESPACE
kubectl apply -f resources/service-binding-secret.yaml -n MYNAMESPACE
kubectl apply -f resources/service-claim.yaml -n MYNAMESPACE
kubectl apply -f resources/class-claim.yaml -n BACKSTAGE_TARGET_NAMESPACE
kubectl get resourceclaim MYCLAIM -n MYNAMESPACE
kubectl get classclaim -n MYNAMESPACE