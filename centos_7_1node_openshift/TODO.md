# Things to fix and/or enable

### I1. Enable catalog service
Currently this service was failing for some unknown reason(s). When attempts were made to start it it would fail like so:
```
TASK [openshift_service_catalog : include_tasks] ******************************************************************************************************************************************************************************************
included: /home/vagrant/installcentos/openshift-ansible/roles/openshift_service_catalog/tasks/start.yml for 10.0.2.15

TASK [openshift_service_catalog : Verify that the catalog api server is running] **********************************************************************************************************************************************************
FAILED - RETRYING: Verify that the catalog api server is running (60 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (59 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (58 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (57 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (56 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (55 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (54 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (53 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (52 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (51 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (50 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (49 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (48 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (47 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (46 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (45 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (44 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (43 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (42 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (41 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (40 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (39 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (38 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (37 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (36 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (35 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (34 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (33 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (32 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (31 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (30 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (29 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (28 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (27 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (26 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (25 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (24 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (23 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (22 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (21 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (20 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (19 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (18 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (17 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (16 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (15 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (14 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (13 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (12 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (11 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (10 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (9 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (8 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (7 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (6 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (5 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (4 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (3 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (2 retries left).
FAILED - RETRYING: Verify that the catalog api server is running (1 retries left).
fatal: [10.0.2.15]: FAILED! => {"attempts": 60, "changed": false, "cmd": ["curl", "-k", "https://apiserver.kube-service-catalog.svc/healthz"], "delta": "0:00:00.304952", "end": "2018-10-04 00:29:40.859348", "rc": 0, "start": "2018-10-04 00:29:40.554396", "stderr": "  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current\n                                 Dload  Upload   Total   Spent    Left  Speed\n\r  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0\r100   180  100   180    0     0    629      0 --:--:-- --:--:-- --:--:--   631", "stderr_lines": ["  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current", "                                 Dload  Upload   Total   Spent    Left  Speed", "", "  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0", "100   180  100   180    0     0    629      0 --:--:-- --:--:-- --:--:--   631"], "stdout": "[+]ping ok\n[+]poststarthook/generic-apiserver-start-informers ok\n[+]poststarthook/start-service-catalog-apiserver-informers ok\n[-]etcd failed: reason withheld\nhealthz check failed", "stdout_lines": ["[+]ping ok", "[+]poststarthook/generic-apiserver-start-informers ok", "[+]poststarthook/start-service-catalog-apiserver-informers ok", "[-]etcd failed: reason withheld", "healthz check failed"]}
...ignoring

TASK [openshift_service_catalog : Check status in the kube-service-catalog namespace] *****************************************************************************************************************************************************
changed: [10.0.2.15]

TASK [openshift_service_catalog : debug] **************************************************************************************************************************************************************************************************
ok: [10.0.2.15] => {
    "msg": [
        "In project kube-service-catalog on server https://box-101:8443",
        "",
        "https://apiserver-kube-service-catalog.apps.192.168.56.101.sslip.io (passthrough) to pod port secure (svc/apiserver)",
        "  daemonset/apiserver manages docker.io/openshift/origin-service-catalog:v3.10",
        "    generation #1 running for 12 minutes - 1 pod",
        "  pod/apiserver-jnj84 runs docker.io/openshift/origin-service-catalog:v3.10",
        "",
        "svc/controller-manager - 172.30.46.197:443 -> 6443",
        "  daemonset/controller-manager manages docker.io/openshift/origin-service-catalog:v3.10",
        "    generation #1 running for 11 minutes - 1 pod",
        "  pod/controller-manager-6xgvj runs docker.io/openshift/origin-service-catalog:v3.10",
        "",
        "Errors:",
        "  * route/apiserver is routing traffic to svc/apiserver, but either the administrator has not installed a router or the router is not selecting this route.",
        "",
        "1 error, 2 infos identified, use 'oc status -v' to see details."
    ]
}

TASK [openshift_service_catalog : Get pods in the kube-service-catalog namespace] *********************************************************************************************************************************************************
changed: [10.0.2.15]

TASK [openshift_service_catalog : debug] **************************************************************************************************************************************************************************************************
ok: [10.0.2.15] => {
    "msg": [
        "NAME                       READY     STATUS    RESTARTS   AGE       IP            NODE",
        "apiserver-jnj84            1/1       Running   0          12m       10.128.0.33   box-101",
        "controller-manager-6xgvj   1/1       Running   0          11m       10.128.0.34   box-101"
    ]
}

TASK [openshift_service_catalog : Get events in the kube-service-catalog namespace] *******************************************************************************************************************************************************
changed: [10.0.2.15]

TASK [openshift_service_catalog : debug] **************************************************************************************************************************************************************************************************
ok: [10.0.2.15] => {
    "msg": [
        "LAST SEEN   FIRST SEEN   COUNT     NAME                                                  KIND        SUBOBJECT                             TYPE      REASON             SOURCE                               MESSAGE",
        "12m         12m          1         apiserver-jnj84.155a3fb2aab6d502                      Pod         spec.containers{apiserver}            Normal    Pulling            kubelet, box-101                     pulling image \"docker.io/openshift/origin-service-catalog:v3.10\"",
        "12m         12m          1         apiserver-jnj84.155a3fb89e68a639                      Pod         spec.containers{apiserver}            Normal    Pulled             kubelet, box-101                     Successfully pulled image \"docker.io/openshift/origin-service-catalog:v3.10\"",
        "12m         12m          1         apiserver-jnj84.155a3fb98b6e8f34                      Pod         spec.containers{apiserver}            Normal    Created            kubelet, box-101                     Created container",
        "12m         12m          1         apiserver-jnj84.155a3fba085c2e96                      Pod         spec.containers{apiserver}            Normal    Started            kubelet, box-101                     Started container",
        "12m         12m          1         apiserver.155a3fb141bc2aaa                            DaemonSet                                         Normal    SuccessfulCreate   daemonset-controller                 Created pod: apiserver-jnj84",
        "11m         11m          1         controller-manager-6xgvj.155a3fc11623e223             Pod         spec.containers{controller-manager}   Normal    Pulled             kubelet, box-101                     Container image \"docker.io/openshift/origin-service-catalog:v3.10\" already present on machine",
        "11m         11m          1         controller-manager-6xgvj.155a3fc11e5f94ce             Pod         spec.containers{controller-manager}   Normal    Created            kubelet, box-101                     Created container",
        "11m         11m          1         controller-manager-6xgvj.155a3fc13a7f073b             Pod         spec.containers{controller-manager}   Normal    Started            kubelet, box-101                     Started container",
        "11m         11m          1         controller-manager.155a3fc054734941                   DaemonSet                                         Normal    SuccessfulCreate   daemonset-controller                 Created pod: controller-manager-6xgvj",
        "11m         11m          1         service-catalog-controller-manager.155a3fc172e9039c   ConfigMap                                         Normal    LeaderElection     service-catalog-controller-manager   controller-manager-6xgvj-external-service-catalog-controller became leader"
    ]
}

TASK [openshift_service_catalog : Get pod logs] *******************************************************************************************************************************************************************************************
changed: [10.0.2.15]

TASK [openshift_service_catalog : debug] **************************************************************************************************************************************************************************************************
ok: [10.0.2.15] => {
    "msg": [
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request.WithRequestContext.func1(0x33f7840, 0xc4206c92d0, 0xc420e48800)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request/requestcontext.go:110 +0xcb",
        "net/http.HandlerFunc.ServeHTTP(0xc420527aa0, 0x33f7840, 0xc4206c92d0, 0xc420e48800)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithPanicRecovery.func1(0x33f7840, 0xc4206c92d0, 0xc420e48800)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/wrap.go:41 +0x108",
        "net/http.HandlerFunc.ServeHTTP(0xc420527ac0, 0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server.(*APIServerHandler).ServeHTTP(0xc4202de7e0, 0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/handler.go:197 +0x51",
        "net/http.serverHandler.ServeHTTP(0xc4201bf860, 0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t/usr/lib/golang/src/net/http/server.go:2619 +0xb4",
        "net/http.initNPNRequest.ServeHTTP(0xc42024c700, 0xc4201bf860, 0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t/usr/lib/golang/src/net/http/server.go:3164 +0x9a",
        "net/http.(*initNPNRequest).ServeHTTP(0xc4203b0510, 0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t<autogenerated>:1 +0x63",
        "net/http.(Handler).ServeHTTP-fm(0x33f8440, 0xc420e7e808, 0xc420e48800)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5462 +0x4d",
        "net/http.(*http2serverConn).runHandler(0xc4200a81c0, 0xc420e7e808, 0xc420e48800, 0xc420bd5be0)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5747 +0x89",
        "created by net/http.(*http2serverConn).processHeaders",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5481 +0x495",
        "",
        "logging error output: \"{\\\"metadata\\\":{},\\\"status\\\":\\\"Failure\\\",\\\"message\\\":\\\"Timeout: request did not complete within 1m0s\\\",\\\"reason\\\":\\\"Timeout\\\",\\\"details\\\":{},\\\"code\\\":504}\\n\"",
        " [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:kube-system:generic-garbage-collector] 10.128.0.1:49658]",
        "I1004 00:30:23.035137       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1/clusterservicebrokers?limit=500&resourceVersion=0: (1m0.000296206s) 504",
        "goroutine 18830 [running]:",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).recordStatus(0xc4206543f0, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:207 +0xdd",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).WriteHeader(0xc4206543f0, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:186 +0x35",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*baseTimeoutWriter).timeout(0xc420b72160, 0xc420ce3440)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:201 +0xb3",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*timeoutHandler).ServeHTTP(0xc420527a60, 0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:101 +0x292",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithWaitGroup.func1(0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/waitgroup.go:51 +0xeb",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8ac0, 0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters.WithRequestInfo.func1(0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters/requestinfo.go:45 +0x20f",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8b00, 0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request.WithRequestContext.func1(0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request/requestcontext.go:110 +0xcb",
        "net/http.HandlerFunc.ServeHTTP(0xc420527aa0, 0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithPanicRecovery.func1(0x33f7840, 0xc4206543f0, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/wrap.go:41 +0x108",
        "net/http.HandlerFunc.ServeHTTP(0xc420527ac0, 0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server.(*APIServerHandler).ServeHTTP(0xc4202de7e0, 0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/handler.go:197 +0x51",
        "net/http.serverHandler.ServeHTTP(0xc4201bf860, 0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:2619 +0xb4",
        "net/http.initNPNRequest.ServeHTTP(0xc42024c700, 0xc4201bf860, 0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/server.go:3164 +0x9a",
        "net/http.(*initNPNRequest).ServeHTTP(0xc4203b0510, 0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t<autogenerated>:1 +0x63",
        "net/http.(Handler).ServeHTTP-fm(0x33f8440, 0xc420e7e848, 0xc420e49f00)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5462 +0x4d",
        "net/http.(*http2serverConn).runHandler(0xc4200a81c0, 0xc420e7e848, 0xc420e49f00, 0xc420bd5e80)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5747 +0x89",
        "created by net/http.(*http2serverConn).processHeaders",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5481 +0x495",
        "",
        "logging error output: \"{\\\"metadata\\\":{},\\\"status\\\":\\\"Failure\\\",\\\"message\\\":\\\"Timeout: request did not complete within 1m0s\\\",\\\"reason\\\":\\\"Timeout\\\",\\\"details\\\":{},\\\"code\\\":504}\\n\"",
        " [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:kube-system:generic-garbage-collector] 10.128.0.1:49658]",
        "I1004 00:30:23.035247       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1/serviceinstances?limit=500&resourceVersion=0: (1m0.000625611s) 504",
        "goroutine 18829 [running]:",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).recordStatus(0xc4206c9b20, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:207 +0xdd",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).WriteHeader(0xc4206c9b20, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:186 +0x35",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*baseTimeoutWriter).timeout(0xc420bd5f40, 0xc420ce33b0)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:201 +0xb3",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*timeoutHandler).ServeHTTP(0xc420527a60, 0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:101 +0x292",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithWaitGroup.func1(0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/waitgroup.go:51 +0xeb",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8ac0, 0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters.WithRequestInfo.func1(0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters/requestinfo.go:45 +0x20f",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8b00, 0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request.WithRequestContext.func1(0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request/requestcontext.go:110 +0xcb",
        "net/http.HandlerFunc.ServeHTTP(0xc420527aa0, 0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithPanicRecovery.func1(0x33f7840, 0xc4206c9b20, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/wrap.go:41 +0x108",
        "net/http.HandlerFunc.ServeHTTP(0xc420527ac0, 0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server.(*APIServerHandler).ServeHTTP(0xc4202de7e0, 0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/handler.go:197 +0x51",
        "net/http.serverHandler.ServeHTTP(0xc4201bf860, 0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:2619 +0xb4",
        "net/http.initNPNRequest.ServeHTTP(0xc42024c700, 0xc4201bf860, 0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/server.go:3164 +0x9a",
        "net/http.(*initNPNRequest).ServeHTTP(0xc4203b0510, 0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t<autogenerated>:1 +0x63",
        "net/http.(Handler).ServeHTTP-fm(0x33f8440, 0xc420e7e840, 0xc420e49a00)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5462 +0x4d",
        "net/http.(*http2serverConn).runHandler(0xc4200a81c0, 0xc420e7e840, 0xc420e49a00, 0xc420bd5e20)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5747 +0x89",
        "created by net/http.(*http2serverConn).processHeaders",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5481 +0x495",
        "",
        "logging error output: \"{\\\"metadata\\\":{},\\\"status\\\":\\\"Failure\\\",\\\"message\\\":\\\"Timeout: request did not complete within 1m0s\\\",\\\"reason\\\":\\\"Timeout\\\",\\\"details\\\":{},\\\"code\\\":504}\\n\"",
        " [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:kube-system:generic-garbage-collector] 10.128.0.1:49658]",
        "I1004 00:30:23.035840       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1/clusterserviceplans?limit=500&resourceVersion=0: (1m0.00083387s) 504",
        "goroutine 18831 [running]:",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).recordStatus(0xc420655ab0, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:207 +0xdd",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).WriteHeader(0xc420655ab0, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:186 +0x35",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*baseTimeoutWriter).timeout(0xc420b72300, 0xc420ce34d0)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:201 +0xb3",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*timeoutHandler).ServeHTTP(0xc420527a60, 0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:101 +0x292",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithWaitGroup.func1(0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/waitgroup.go:51 +0xeb",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8ac0, 0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters.WithRequestInfo.func1(0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters/requestinfo.go:45 +0x20f",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8b00, 0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request.WithRequestContext.func1(0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request/requestcontext.go:110 +0xcb",
        "net/http.HandlerFunc.ServeHTTP(0xc420527aa0, 0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithPanicRecovery.func1(0x33f7840, 0xc420655ab0, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/wrap.go:41 +0x108",
        "net/http.HandlerFunc.ServeHTTP(0xc420527ac0, 0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server.(*APIServerHandler).ServeHTTP(0xc4202de7e0, 0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/handler.go:197 +0x51",
        "net/http.serverHandler.ServeHTTP(0xc4201bf860, 0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:2619 +0xb4",
        "net/http.initNPNRequest.ServeHTTP(0xc42024c700, 0xc4201bf860, 0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/server.go:3164 +0x9a",
        "net/http.(*initNPNRequest).ServeHTTP(0xc4203b0510, 0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t<autogenerated>:1 +0x63",
        "net/http.(Handler).ServeHTTP-fm(0x33f8440, 0xc420e7e850, 0xc420a56200)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5462 +0x4d",
        "net/http.(*http2serverConn).runHandler(0xc4200a81c0, 0xc420e7e850, 0xc420a56200, 0xc420bd5ec0)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5747 +0x89",
        "created by net/http.(*http2serverConn).processHeaders",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5481 +0x495",
        "",
        "logging error output: \"{\\\"metadata\\\":{},\\\"status\\\":\\\"Failure\\\",\\\"message\\\":\\\"Timeout: request did not complete within 1m0s\\\",\\\"reason\\\":\\\"Timeout\\\",\\\"details\\\":{},\\\"code\\\":504}\\n\"",
        " [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:kube-system:generic-garbage-collector] 10.128.0.1:49658]",
        "I1004 00:30:23.058450       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1/servicebindings?limit=500&resourceVersion=0: (1m0.000247347s) 504",
        "goroutine 18842 [running]:",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).recordStatus(0xc4206dc850, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:207 +0xdd",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog.(*respLogger).WriteHeader(0xc4206dc850, 0x1f8)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/httplog/httplog.go:186 +0x35",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*baseTimeoutWriter).timeout(0xc420b73c80, 0xc420ce3c20)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:201 +0xb3",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.(*timeoutHandler).ServeHTTP(0xc420527a60, 0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/timeout.go:101 +0x292",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithWaitGroup.func1(0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/waitgroup.go:51 +0xeb",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8ac0, 0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters.WithRequestInfo.func1(0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/filters/requestinfo.go:45 +0x20f",
        "net/http.HandlerFunc.ServeHTTP(0xc4202b8b00, 0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request.WithRequestContext.func1(0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/endpoints/request/requestcontext.go:110 +0xcb",
        "net/http.HandlerFunc.ServeHTTP(0xc420527aa0, 0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters.WithPanicRecovery.func1(0x33f7840, 0xc4206dc850, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/filters/wrap.go:41 +0x108",
        "net/http.HandlerFunc.ServeHTTP(0xc420527ac0, 0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:1918 +0x44",
        "github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server.(*APIServerHandler).ServeHTTP(0xc4202de7e0, 0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t/tmp/openshift/build-rpms/rpm/BUILD/origin-service-catalog-3.10.0/_output/local/go/src/github.com/kubernetes-incubator/service-catalog/vendor/k8s.io/apiserver/pkg/server/handler.go:197 +0x51",
        "net/http.serverHandler.ServeHTTP(0xc4201bf860, 0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:2619 +0xb4",
        "net/http.initNPNRequest.ServeHTTP(0xc42024c700, 0xc4201bf860, 0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/server.go:3164 +0x9a",
        "net/http.(*initNPNRequest).ServeHTTP(0xc4203b0510, 0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t<autogenerated>:1 +0x63",
        "net/http.(Handler).ServeHTTP-fm(0x33f8440, 0xc420e7e970, 0xc420a57d00)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5462 +0x4d",
        "net/http.(*http2serverConn).runHandler(0xc4200a81c0, 0xc420e7e970, 0xc420a57d00, 0xc420b73740)",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5747 +0x89",
        "created by net/http.(*http2serverConn).processHeaders",
        "\t/usr/lib/golang/src/net/http/h2_bundle.go:5481 +0x495",
        "",
        "logging error output: \"{\\\"metadata\\\":{},\\\"status\\\":\\\"Failure\\\",\\\"message\\\":\\\"Timeout: request did not complete within 1m0s\\\",\\\"reason\\\":\\\"Timeout\\\",\\\"details\\\":{},\\\"code\\\":504}\\n\"",
        " [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:kube-system:generic-garbage-collector] 10.128.0.1:49658]",
        "I1004 00:30:24.946813       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1?timeout=32s: (1.208833ms) 200 [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:openshift-infra:resourcequota-controller] 10.128.0.1:49658]",
        "I1004 00:30:25.824160       1 wrap.go:42] GET /apis/servicecatalog.k8s.io/v1beta1?timeout=32s: (11.869699ms) 200 [[openshift/v1.10.0+b81c8f8 (linux/amd64) kubernetes/b81c8f8/system:serviceaccount:openshift-infra:horizontal-pod-autoscaler] 10.128.0.1:49658]"
    ]
}

TASK [openshift_service_catalog : Report errors] ******************************************************************************************************************************************************************************************
fatal: [10.0.2.15]: FAILED! => {"changed": false, "msg": "Catalog install failed."}
	to retry, use: --limit @/home/vagrant/installcentos/openshift-ansible/playbooks/deploy_cluster.retry

PLAY RECAP ********************************************************************************************************************************************************************************************************************************
10.0.2.15                  : ok=1024 changed=392  unreachable=0    failed=1
localhost                  : ok=12   changed=0    unreachable=0    failed=0


INSTALLER STATUS **************************************************************************************************************************************************************************************************************************
Initialization              : Complete (0:00:16)
	[DEPRECATION WARNING]: The following are deprecated variables and will be no longer be used in the next minor release. Please update your inventory accordingly.
	openshift_node_kubelet_args
Health Check                : Complete (0:00:31)
Node Bootstrap Preparation  : Complete (0:06:13)
etcd Install                : Complete (0:00:39)
Master Install              : Complete (0:03:53)
Master Additional Install   : Complete (0:00:38)
Node Join                   : Complete (0:00:10)
Hosted Install              : Complete (0:00:53)
Web Console Install         : Complete (0:01:12)
Metrics Install             : Complete (0:01:59)
Logging Install             : Complete (0:02:50)
Service Catalog Install     : In Progress (0:15:49)
	This phase can be restarted by running: playbooks/openshift-service-catalog/config.yml


Failure summary:


  1. Hosts:    10.0.2.15
     Play:     Service Catalog
     Task:     Report errors
     Message:  Catalog install failed.
Adding password for user slm
cluster role "cluster-admin" added: "slm"
******
* Your console is https://console.192.168.56.101.sslip.io:8443
* Your username is slm
* Your password is password
*
* Login using:
*
$ oc login -u slm -p password https://console.192.168.56.101.sslip.io:8443/
******
Login successful.

You have one project on this server: "default"

Using project "default".
[root@box-101 installcentos]#
[root@box-101 installcentos]#
```

### I2. Enable metrics service
### I3. Enable logging service
### I4. Enable TLS/SSL certificate for console.192.168.56.101.sslip.io
