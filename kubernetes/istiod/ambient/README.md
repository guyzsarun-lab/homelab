# Upgrading from Sidecar to Ambient

Install Kubernetes Gateway API CRDs if not already installed:

```bash
kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/experimental-install.yaml
```


# Ambient Install

## Istiod Canary

```bash
helm install istiod-canary istio/istiod --namespace istio-system --set profile=ambient --set revision=canary

(⎈|talos-proxmox-kube-01:istio-system)➜  ~ k get po
NAME                                            READY   STATUS    RESTARTS      AGE
istio-ingressgateway-7bb74ff5cf-kjflm           1/1     Running   8 (57d ago)   95d
istiod-c6fdbdd88-b2kn9                          1/1     Running   0             29d
istiod-canary-69968bcb8d-jm7w4                  1/1     Running   0             20s
jaeger-66c8485cdf-ddmtv                         1/1     Running   2 (57d ago)   76d
kiali-5fcbc4bc4-kvqt4                           1/1     Running   2 (57d ago)   78d
otel-opentelemetry-collector-6588b8c54d-d788l   1/1     Running   7 (57d ago)   76d
```

## CNI Node canary

```bash
helm install istio-cni istio/cni -n istio-system --set profile=ambient --set revision=canary

(⎈|talos-proxmox-kube-01:istio-system)➜  ~ k get ds
NAME             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
istio-cni-node   5         5         1       5            1           kubernetes.io/os=linux   26s
```

## Switch workloads to canary

```bash
helm install ztunnel istio/ztunnel -n istio-system --set revision=canary
```

- Create test resource and label namespace with `istio.io/dataplane-mode: ambient`
- Verify no sidecar is injected

## Promote canary to default

```bash
(⎈|talos-proxmox-kube-01:default)➜  ~ istioctl tag list
TAG         REVISION NAMESPACES
prod-canary canary
default     default

istioctl tag remove default

istioctl tag set default --revision canary

```





