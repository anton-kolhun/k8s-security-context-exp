# Usage of  prometheus helm chart


## Building docker image 
```
docker build -t k8s-sec:1 .
```

```

### Install  helm chart
```
cd sec-exp
helm install sec-exp -n test --create-namespace .
```

