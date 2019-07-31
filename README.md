# go_kube_command
Passing kubernetes secrets through a go app command line

~~~~
# kubectl create secret generic my-super-secret-secret --from-literal=my-first-name=Chris --from-literal=my-last-name=Gianelle
# kubectl apply -f gokubecommand.yaml
# kubectl get pods
NAME                                    READY   STATUS    RESTARTS   AGE
gokubecmd-deployment-6444746c7d-5tk7x   1/1     Running   0          9s
# kubectl logs gokubecmd-deployment-6444746c7d-5tk7x
[-application.firstName=Chris -application.lastName=Gianelle]
# kubectl exec gokubecmd-deployment-6444746c7d-5tk7x -- env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=gokubecmd-deployment-6444746c7d-5tk7x
SECRET_FIRST_NAME=Chris
SECRET_LAST_NAME=Gianelle
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
HOME=/app
~~~~
