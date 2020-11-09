# Waypoint playground

## Overview


## Getting started

k create ns waypoint
waypoint install --platform=kubernetes -accept-tos -namespace=waypoint
k create ns node-service-ms
k get ns node-service-ms

./scripts/render.sh

waypoint init

waypoint up

$ k get pods
NAME                                                           READY   STATUS    RESTARTS   AGE
waypoint-test-app-01epnxbkfnpr4kmg60sr2zekhh-bbd56c6c7-4gqs7   1/1     Running   0          64s
waypoint-test-app-01epnxbkfnpr4kmg60sr2zekhh-bbd56c6c7-9q7d5   1/1     Running   0          64s

$ k get mapping
NAME                           PREFIX                SERVICE                                            STATE     REASON
waypoint-example-test-master   /waypoint-infratest   example-nodejs.node-service-ms.svc.cluster.local   Running

$ k get svc
NAME                TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
waypoint-test-app   ClusterIP   172.27.97.244   <none>        80/TCP    76s

$ k get deployment
NAME                                           READY   UP-TO-DATE   AVAILABLE   AGE
waypoint-test-app-01epnxbkfnpr4kmg60sr2zekhh   2/2     2            2           104s







