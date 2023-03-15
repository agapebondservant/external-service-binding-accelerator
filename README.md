# External Service Bindings Accelerator

This is an accelerator that can be used to generate a Service Claim for off-platform services, 
using the Service Binding specification covered [here](https://docs.vmware.com/en/Services-Toolkit-for-VMware-Tanzu-Application-Platform/0.8/svc-tlk/GUID-usecases-direct_secret_references.html).

* Install App Accelerator: (see https://docs.vmware.com/en/Tanzu-Application-Platform/1.0/tap/GUID-cert-mgr-contour-fcd-install-cert-mgr.html)
```
tanzu package available list accelerator.apps.tanzu.vmware.com --namespace tap-install
tanzu package install accelerator -p accelerator.apps.tanzu.vmware.com -v 1.0.1 -n tap-install -f resources/app-accelerator-values.yaml
Verify that package is running: tanzu package installed get accelerator -n tap-install
Get the IP address for the App Accelerator API: kubectl get service -n accelerator-system
```

Publish Accelerators:
```
tanzu plugin install --local <path-to-tanzu-cli> all
tanzu acc create servicebinding --git-repository https://github.com/agapebondservant/external-service-binding-accelerator.git --git-branch main
```

## Contents
1. [Creating a Service Claim](#serviceclaim)

### Creating a Service Claim<a name="serviceclaim"/>
Use the Accelerator GUI to update the relevant properties:
* type (the type of service - postgres, greenplum, snowflake, etc)
* provider (the name of the vendor - azure, aws, vmware, etc)
* host (the FQDN of the host)
* port (the access port)
* database (the database or schema)
* username (the username credential)
* password (the password credential)
* claim (name of Service Claim)

Next, generate the **service-binding-secret** yaml file which will be used to generate the claim (NOTE: DO NOT check **service-binding-secret.yaml** into git):
```
resources/set_ext_service_binding_env.sh
```

Now the ServiceClaim should be available to be bound to your Workloads. Use the name provided above.
