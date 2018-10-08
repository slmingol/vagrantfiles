# OpenShift VM
This Vagrantfile will setup openshift (3.10) using the [oc cluster up](https://docs.okd.io/latest/getting_started/administrators.html) method on a single node CentOS 7.x VM (VirtualBox). The VM is currently sized at 2048MB. It should be completely useable.

# Building
To rebuild this VM from scratch, simply clone this repo and then 'up' it.

```
$ git clone https://github.com/slmingol/vagrantfiles
$ cd centos_7_1node_okd
$ vagrant up
```

As it builds, you'll see output similar to this:

```
...
...
    default: Adding default OAuthClient redirect URIs ...
    default: Adding centos-imagestreams ...
    default: Adding sample-templates ...
    default: Adding registry ...
    default: Adding router ...
    default: Adding persistent-volumes ...
    default: Adding web-console ...
    default: I1008 12:06:13.394024   19647 interface.go:26] Installing "centos-imagestreams" ...
    default: I1008 12:06:13.394032   19647 interface.go:26] Installing "sample-templates" ...
    default: I1008 12:06:13.394037   19647 interface.go:26] Installing "openshift-image-registry" ...
    default: I1008 12:06:13.394041   19647 interface.go:26] Installing "openshift-router" ...
    default: I1008 12:06:13.394045   19647 interface.go:26] Installing "persistent-volumes" ...
    default: I1008 12:06:13.394053   19647 interface.go:26] Installing "openshift-web-console-operator" ...
    default: I1008 12:06:13.394313   19647 apply_template.go:83] Installing "openshift-web-console-operator"
    default: I1008 12:06:13.394421   19647 apply_list.go:68] Installing "centos-imagestreams"
    default: I1008 12:06:13.394572   19647 interface.go:26] Installing "sample-templates/django quickstart" ...
    default: I1008 12:06:13.394579   19647 interface.go:26] Installing "sample-templates/nodejs quickstart" ...
    default: I1008 12:06:13.394583   19647 interface.go:26] Installing "sample-templates/rails quickstart" ...
    default: I1008 12:06:13.394587   19647 interface.go:26] Installing "sample-templates/jenkins pipeline ephemeral" ...
    default: I1008 12:06:13.394592   19647 interface.go:26] Installing "sample-templates/sample pipeline" ...
    default: I1008 12:06:13.394596   19647 interface.go:26] Installing "sample-templates/postgresql" ...
    default: I1008 12:06:13.394601   19647 interface.go:26] Installing "sample-templates/cakephp quickstart" ...
    default: I1008 12:06:13.394605   19647 interface.go:26] Installing "sample-templates/dancer quickstart" ...
    default: I1008 12:06:13.394609   19647 interface.go:26] Installing "sample-templates/mongodb" ...
    default: I1008 12:06:13.394614   19647 interface.go:26] Installing "sample-templates/mariadb" ...
    default: I1008 12:06:13.394617   19647 interface.go:26] Installing "sample-templates/mysql" ...
    default: I1008 12:06:13.394644   19647 apply_list.go:68] Installing "sample-templates/mysql"
    default: I1008 12:06:13.395384   19647 apply_list.go:68] Installing "sample-templates/django quickstart"
    default: I1008 12:06:13.395487   19647 apply_list.go:68] Installing "sample-templates/nodejs quickstart"
    default: I1008 12:06:13.395575   19647 apply_list.go:68] Installing "sample-templates/rails quickstart"
    default: I1008 12:06:13.395671   19647 apply_list.go:68] Installing "sample-templates/jenkins pipeline ephemeral"
    default: I1008 12:06:13.395751   19647 apply_list.go:68] Installing "sample-templates/sample pipeline"
    default: I1008 12:06:13.395845   19647 apply_list.go:68] Installing "sample-templates/postgresql"
    default: I1008 12:06:13.395928   19647 apply_list.go:68] Installing "sample-templates/cakephp quickstart"
    default: I1008 12:06:13.396008   19647 apply_list.go:68] Installing "sample-templates/dancer quickstart"
    default: I1008 12:06:13.396087   19647 apply_list.go:68] Installing "sample-templates/mongodb"
    default: I1008 12:06:13.396166   19647 apply_list.go:68] Installing "sample-templates/mariadb"
    default: I1008 12:06:29.467023   19647 interface.go:41] Finished installing "sample-templates/django quickstart" "sample-templates/nodejs quickstart" "sample-templates/rails quickstart" "sample-templates/jenkins pipeline ephemeral" "sample-templates/sample pipeline" "sample-templates/postgresql" "sample-templates/cakephp quickstart" "sample-templates/dancer quickstart" "sample-templates/mongodb" "sample-templates/mariadb" "sample-templates/mysql"
    default: I1008 12:07:09.763360   19647 interface.go:41] Finished installing "centos-imagestreams" "sample-templates" "openshift-image-registry" "openshift-router" "persistent-volumes" "openshift-web-console-operator"
    default: Login to server ...
    default: Creating initial project "myproject" ...
    default: Server Information ...
    default: OpenShift server started.
    default:
    default: The server is accessible via web console at:
    default:     https://192.168.56.101.sslip.io:8443
    default:
    default: You are logged in as:
    default:     User:     developer
    default:     Password: <any value>
    default:
    default: To login as administrator:
    default:     oc login -u system:admin

==> default: Machine 'default' has a post `vagrant up` message. This is a message
==> default: from the creator of the Vagrantfile, and not from Vagrant itself:
==> default:
==> default:     Login to server ...
==> default:     Creating initial project "myproject" ...
==> default:     Server Information ...
==> default:     OpenShift server started.
==> default:
==> default:     The server is accessible via web console at:
==> default:         https://192.168.56.101.sslip.io:8443
==> default:
==> default:     You are logged in as:
==> default:         User:     developer
==> default:         Password: <any value>
==> default:
==> default:     To login as administrator:
==> default:         oc login -u system:admin
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
[vagrant@box-101 ~]$ oc login -u system -p password
Server [https://localhost:8443]:
The server uses a certificate signed by an unknown authority.
You can bypass the certificate check, but any data you send to the server could be intercepted by others.
Use insecure connections? (y/n): y

Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>

Welcome! See 'oc help' to get started.
```

## Examples:
```
[root@box-101 vagrant]# oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git
--> Found Docker image e42d0dc (4 months old) from Docker Hub for "centos/ruby-22-centos7"

    Ruby 2.2
    --------
    Ruby 2.2 available as container is a base platform for building and running various Ruby 2.2 applications and frameworks. Ruby is the interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (as in Perl). It is simple, straight-forward, and extensible.

    Tags: builder, ruby, ruby22

    * An image stream will be created as "ruby-22-centos7:latest" that will track the source image
    * A source build using source code from https://github.com/openshift/ruby-ex.git will be created
      * The resulting image will be pushed to image stream "ruby-ex:latest"
      * Every time "ruby-22-centos7:latest" changes a new build will be triggered
    * This image will be deployed in deployment config "ruby-ex"
    * Port 8080/tcp will be load balanced by service "ruby-ex"
      * Other containers can access this service through the hostname "ruby-ex"

--> Creating resources ...
    imagestream "ruby-22-centos7" created
    imagestream "ruby-ex" created
    buildconfig "ruby-ex" created
    deploymentconfig "ruby-ex" created
    service "ruby-ex" created
--> Success
    Build scheduled, use 'oc logs -f bc/ruby-ex' to track its progress.
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/ruby-ex'
    Run 'oc status' to view your app.
```


```
[vagrant@box-101 ~]$ oc get nodes
```

```
[vagrant@box-101 ~]$ oc get nodes
[vagrant@box-101 ~]$ oc describe nodes
[vagrant@box-101 ~]$
```

## Web UI
- Your console is https://console.192.168.56.101.sslip.io:8443
- Your username is developer
- Your password is <anything>

# References
The crux of my installation looks like this for OpenShift:
```
    yum install -y git vim socat tcpdump wget docker
    cp -f /vagrant/daemon.json /etc/docker/.
    systemctl start docker
    wget https://github.com/openshift/origin/releases/download/v3.10.0/origin.repo -P /etc/yum.repos.d/
    yum install -y origin-clients
    oc cluster up --routing-suffix=192.168.56.101.sslip.io --public-hostname=192.168.56.101.sslip.io
```

- https://github.com/openshift/origin/blob/master/docs/cluster_up_down.md
