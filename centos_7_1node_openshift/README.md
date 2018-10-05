# OpenShift VM
This Vagrantfile will setup openshift (3.10) using the [origin ansible playbooks](https://github.com/openshift/openshift-ansible) on a single node CentOS 7.x VM (VirtualBox). The VM is currently sized at 2048MB and has 3 OpenShift components disabled:

- catalog service
- logging
- metrics

Otherwise it's completely useable.

# Building
To rebuild this VM from scratch, simply clone this repo and then 'up' it.

```
$ git clone https://github.com/slmingol/installcentos
$ vagrant up
```

As it builds, you'll see output similar to this:

```
...
...
    default: INSTALLER STATUS ***************************************************************
    default: Initialization              : Complete (0:00:12)
    default: 	[DEPRECATION WARNING]: The following are deprecated variables and will be no longer be used in the next minor release. Please update your inventory accordingly.
    default: 	openshift_node_kubelet_args
    default: Health Check                : Complete (0:00:11)
    default: Node Bootstrap Preparation  : Complete (0:02:20)
    default: etcd Install                : Complete (0:00:31)
    default: Master Install              : Complete (0:03:45)
    default: Master Additional Install   : Complete (0:00:33)
    default: Node Join                   : Complete (0:00:08)
    default: Hosted Install              : Complete (0:00:46)
    default: Web Console Install         : Complete (0:00:57)
    default: Adding password for user user1
    default: cluster role "cluster-admin" added: "user1"
    default: ******
    default: * Your console is https://console.192.168.56.101.sslip.io:8443
    default: * Your username is user1
    default: * Your password is password
    default: *
    default: * Login using:
    default: *
    default: $ oc login -u user1 -p password https://console.192.168.56.101.sslip.io:8443/
    default: ******
    default: Login successful.
    default: You have one project on this server: "default"
    default:
    default: Using project "default".
```

# Usage
Once the VM has either completed a build or has been brought up via `vagrant up`, you can SSH into the VM like so:
```
$ vagrant ssh
Last login: Fri Oct  5 14:16:32 2018 from 10.0.2.2
[vagrant@box-101 ~]$
```

You can then start using OpenShift's CLI tool, `oc`, to login and interact with the OpenShift cluster.
```
[vagrant@box-101 ~]$ oc login -u user1 -p password https://console.192.168.56.101.sslip.io:8443/
The server uses a certificate signed by an unknown authority.
You can bypass the certificate check, but any data you send to the server could be intercepted by others.
Use insecure connections? (y/n): y

Login successful.

You have access to the following projects and can switch between them with 'oc project <projectname>':

  * default
    kube-public
    kube-system
    management-infra
    openshift
    openshift-infra
    openshift-logging
    openshift-node
    openshift-sdn
    openshift-web-console

Using project "default".
Welcome! See 'oc help' to get started.
```

## Examples:
```
[vagrant@box-101 ~]$ oc get nodes
NAME      STATUS    ROLES                  AGE       VERSION
box-101   Ready     compute,infra,master   53m       v1.10.0+b81c8f8
```

```
[vagrant@box-101 ~]$ oc get nodes
NAME      STATUS    ROLES                  AGE       VERSION
box-101   Ready     compute,infra,master   53m       v1.10.0+b81c8f8
[vagrant@box-101 ~]$ oc describe nodes
Name:               box-101
Roles:              compute,infra,master
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/hostname=box-101
                    node-role.kubernetes.io/compute=true
                    node-role.kubernetes.io/infra=true
                    node-role.kubernetes.io/master=true
Annotations:        node.openshift.io/md5sum=4f5f80c28afbecbefbe2df923d85a942
                    volumes.kubernetes.io/controller-managed-attach-detach=true
CreationTimestamp:  Fri, 05 Oct 2018 13:45:41 +0000
Taints:             <none>
Unschedulable:      false
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  OutOfDisk        False   Fri, 05 Oct 2018 14:39:47 +0000   Fri, 05 Oct 2018 13:45:31 +0000   KubeletHasSufficientDisk     kubelet has sufficient disk space available
  MemoryPressure   False   Fri, 05 Oct 2018 14:39:47 +0000   Fri, 05 Oct 2018 13:45:31 +0000   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Fri, 05 Oct 2018 14:39:47 +0000   Fri, 05 Oct 2018 13:45:31 +0000   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Fri, 05 Oct 2018 14:39:47 +0000   Fri, 05 Oct 2018 13:45:31 +0000   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            True    Fri, 05 Oct 2018 14:39:47 +0000   Fri, 05 Oct 2018 13:49:04 +0000   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  10.0.2.15
  Hostname:    box-101
Capacity:
 cpu:            1
 hugepages-2Mi:  0
 memory:         1882804Ki
 pods:           250
Allocatable:
 cpu:            1
 hugepages-2Mi:  0
 memory:         1780404Ki
 pods:           250
System Info:
 Machine ID:                 876d7c0ab7d14250adfee6bc7de200a5
 System UUID:                876D7C0A-B7D1-4250-ADFE-E6BC7DE200A5
 Boot ID:                    843ad8d8-ff6c-4f90-b46a-7254cd06f406
 Kernel Version:             3.10.0-862.14.4.el7.x86_64
 OS Image:                   CentOS Linux 7 (Core)
 Operating System:           linux
 Architecture:               amd64
 Container Runtime Version:  docker://1.13.1
 Kubelet Version:            v1.10.0+b81c8f8
 Kube-Proxy Version:         v1.10.0+b81c8f8
ExternalID:                  box-101
Non-terminated Pods:         (10 in total)
  Namespace                  Name                           CPU Requests  CPU Limits  Memory Requests  Memory Limits
  ---------                  ----                           ------------  ----------  ---------------  -------------
  default                    docker-registry-1-n96c4        100m (10%)    0 (0%)      256Mi (14%)      0 (0%)
  default                    registry-console-1-fjgbr       0 (0%)        0 (0%)      0 (0%)           0 (0%)
  default                    router-1-nqkzj                 100m (10%)    0 (0%)      256Mi (14%)      0 (0%)
  kube-system                master-api-box-101             0 (0%)        0 (0%)      0 (0%)           0 (0%)
  kube-system                master-controllers-box-101     0 (0%)        0 (0%)      0 (0%)           0 (0%)
  kube-system                master-etcd-box-101            0 (0%)        0 (0%)      0 (0%)           0 (0%)
  openshift-node             sync-5spdz                     0 (0%)        0 (0%)      0 (0%)           0 (0%)
  openshift-sdn              ovs-krpsn                      100m (10%)    200m (20%)  300Mi (17%)      400Mi (23%)
  openshift-sdn              sdn-vvs2r                      100m (10%)    0 (0%)      200Mi (11%)      0 (0%)
  openshift-web-console      webconsole-57d88df7d9-hpv44    100m (10%)    0 (0%)      100Mi (5%)       0 (0%)
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  CPU Requests  CPU Limits  Memory Requests  Memory Limits
  ------------  ----------  ---------------  -------------
  500m (50%)    200m (20%)  1112Mi (63%)     400Mi (23%)
Events:
  Type    Reason                   Age                From              Message
  ----    ------                   ----               ----              -------
  Normal  Starting                 54m                kubelet, box-101  Starting kubelet.
  Normal  NodeHasNoDiskPressure    54m (x5 over 54m)  kubelet, box-101  Node box-101 status is now: NodeHasNoDiskPressure
  Normal  NodeAllocatableEnforced  54m                kubelet, box-101  Updated Node Allocatable limit across pods
  Normal  NodeHasSufficientDisk    54m (x6 over 54m)  kubelet, box-101  Node box-101 status is now: NodeHasSufficientDisk
  Normal  NodeHasSufficientMemory  54m (x6 over 54m)  kubelet, box-101  Node box-101 status is now: NodeHasSufficientMemory
  Normal  NodeHasSufficientPID     54m (x6 over 54m)  kubelet, box-101  Node box-101 status is now: NodeHasSufficientPID
  Normal  Starting                 51m                kubelet, box-101  Starting kubelet.
  Normal  NodeHasSufficientDisk    51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientDisk
  Normal  NodeHasSufficientMemory  51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientMemory
  Normal  NodeHasNoDiskPressure    51m                kubelet, box-101  Node box-101 status is now: NodeHasNoDiskPressure
  Normal  NodeHasSufficientPID     51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientPID
  Normal  NodeAllocatableEnforced  51m                kubelet, box-101  Updated Node Allocatable limit across pods
  Normal  NodeReady                51m                kubelet, box-101  Node box-101 status is now: NodeReady
  Normal  Starting                 51m                kubelet, box-101  Starting kubelet.
  Normal  NodeHasSufficientDisk    51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientDisk
  Normal  NodeHasSufficientMemory  51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientMemory
  Normal  NodeHasNoDiskPressure    51m                kubelet, box-101  Node box-101 status is now: NodeHasNoDiskPressure
  Normal  NodeHasSufficientPID     51m                kubelet, box-101  Node box-101 status is now: NodeHasSufficientPID
  Normal  NodeNotReady             51m                kubelet, box-101  Node box-101 status is now: NodeNotReady
  Normal  NodeAllocatableEnforced  50m                kubelet, box-101  Updated Node Allocatable limit across pods
  Normal  NodeReady                50m                kubelet, box-101  Node box-101 status is now: NodeReady
[vagrant@box-101 ~]$
```

## Web UI
- Your console is https://console.192.168.56.101.sslip.io:8443
- Your username is user1
- Your password is password

# References
This Vagrantfile builds off of the work done by [gshipley/installcentos](https://github.com/gshipley/installcentos). That repo is forked here in my own repo, [slmingol/insatllcentos](https://github.com/slmingol/installcentos). The core modifications that I've made have to do with the abilityt to enable/disable services such as catalog, metrics, & logging. I've also moved to using sslip.io instead of nip.io or xip.io. Neither of these services would work in my particular case.

The crux of my installation looks like this for OpenShift:
```
    yum install -y git vim socat tcpdump
    git clone https://github.com/slmingol/installcentos.git
    cd installcentos
    set -a
    INTERACTIVE=false
    DOMAIN=192.168.56.101.sslip.io
    USERNAME=user1
    PASSWORD=password
    VERSION=3.10
    IP=10.0.2.15
    API_PORT=8443
    CATALOGS=False
    set +a
    ./install-openshift.sh 2>&1 | tee /tmp/install-openshift.log
```
