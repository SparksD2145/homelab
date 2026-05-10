# Homelab Configuration

This is a consolidated, [GitOps](https://about.gitlab.com/topics/gitops/)-oriented, declarative configuration for my homelab.

## Table of Contents
- [Prerequisites](#prerequisites)
    - [Tools](#tools)
- [Repository Structure](#repository-structure)
    - [NixOS](#nixos)
    - [Kubernetes](#kubernetes)
    - [Provisioning](#provisioning)
- [Kubernetes Installation](#kubernetes-installation)
    - [Setting up Age](#-setting-up-age)
    - [GitOps with Flux](#-gitops-with-flux)


## Prerequisites

### Tools

In nix, these CLI tools will be installed to your shell temporarily on `direnv` activation. You will need [nix-direnv](https://search.nixos.org/packages?channel=unstable&query=direnv#show=direnv) to make this work!

| Tool                                                      | Purpose                                                                                                                                  |
| --------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| [kubectl](https://kubernetes.io/docs/reference/kubectl/)  | Exports env vars based on present working directory                                                                                      |
| [krew](https://krew.sigs.k8s.io/)                         | Krew is the plugin manager for kubectl command-line tool.                                                                                |
| [helm](https://helm.sh/)                                  | Manage Kubernetes applications                                                                                                           |
| [kustomize](https://kustomize.io/)                        | Template-free way to customize application configuration                                                                                 |
| [flux](https://toolkit.fluxcd.io/)                        | Operator that manages your k8s cluster based on your Git repository                                                                      |
| [ansible](https://www.ansible.com)                        | Preparing Ubuntu for Kubernetes and installing k3s                                                                                       |
| [go-task](https://github.com/go-task/task)                | A task runner / simpler Make alternative written in Go                                                                                   |
| [jq](https://stedolan.github.io/jq/)                      | Work with JSON values                                                                                                                    |
| [yq](https://stedolan.github.io/jq/)                      | Work with YAML values                                                                                                                    |
| [kubectl](https://kubernetes.io/docs/tasks/tools/)        | Allows you to run commands against Kubernetes clusters                                                                                   |
| [sops](https://github.com/mozilla/sops)                   | Encrypts k8s secrets with Age                                                                                                            |
| [age](https://github.com/FiloSottile/age)                 | A simple, modern and secure encryption tool (and Go library) with small explicit keys, no config options, and UNIX-style composability.  |
| [opentofu](https://opentofu.org)                          | Prepare a Cloudflare domain to be used with the cluster                                                                                  |
| [pre-commit](https://github.com/pre-commit/pre-commit)    | Runs checks pre `git commit`                                                                                                             |
| [gitleaks](https://github.com/zricethezav/gitleaks)       | Scan git repos (or files) for secrets                                                                                                    |
| [prettier](https://github.com/prettier/prettier)          | Prettier is an opinionated code formatter.                                                                                               |
| [ipmitool](https://github.com/ipmitool/ipmitool)          | ipmitool is a utility for managing and configuring devices that support the Intelligent Platform Management Interface.                   |
| [nixfmt](https://github.com/ipmitool/ipmitool)            | nix formater                                                                                                                             |
| [nil](https://github.com/ipmitool/ipmitool)               | nix tools                                                                                                                                |


## Repository Structure

### NixOS
This repository contains a `flake.nix` and the following directories under `hosts` to define configurations for all of my systems.
This repository also contains a `shell.nix`, which `direnv` reads to set up all tooling packages and environment variables.

- **flake.nix** is the nix flake entrypoint for all of our system configurations
- **modules** directory contains all NixOS modules which can be shared between hosts
- **servers** directory contains all server definitions
- **workstations** directory contains all workstation definitions (desktop and laptop configurations)

```
flake.nix
hosts
├── modules
├── servers
└── workstations
```

### Kubernetes
This repository contains the following directories under `cluster` and are ordered below by how Flux will apply them.

- **base** directory is the entrypoint to Flux
- **crds** directory contains custom resource definitions (CRDs) that need to exist globally in your cluster before anything else exists
- **core** directory (depends on **crds**) are important infrastructure applications (grouped by namespace) that should never be pruned by Flux
- **apps** directory (depends on **core**) is where your common applications (grouped by namespace) could be placed, Flux will prune resources here if they are not tracked by Git anymore

```
cluster
├── apps
│   ├── default
│   ├── networking
│   └──
├── base
│   └── flux-system
├── core
│   ├── cert-manager
│   ├── metallb-system
│   ├── namespaces
│   └── system-upgrade
└── crds
    └── cert-manager
```

### Provisioning
This repository contians a the following directories under `provision` which contains scripts and tooling for the homelab.

- **ansible** - consolidates all [Ansible](https://docs.ansible.com/) playbooks and inventory
- **scripts** - miscellaneous scripts and tools
- **terraform** - contains all [terraform](https://developer.hashicorp.com/terraform)/[opentofu](https://opentofu.org/) definitions (networking, virtualization)

```
provision
├── ansible
│   ├── inventory
│   ├── playbooks
│   └── roles
├── scripts
├── terraform
    ├── libvirt
    └── opnsense
```




## Kubernetes Installation

Very first step will be to create a new repository by clicking the **Use this template** button on this page.

Clone the repo to you local workstation and `cd` into it.

**All of the below commands** are run on your **local** workstation, **not** on any of your cluster nodes.

### 🔐 Setting up Age

Create a Age Private and Public key. Using SOPS with Age allows us to encrypt and decrypt secrets.

1. Create a Age Private / Public Key

```sh
age-keygen -o age.agekey
```

2. Set up the directory for the Age key and move the Age file to it

```sh
mkdir -p ~/.config/sops/age
mv age.agekey ~/.config/sops/age/keys.txt
```

3. Export the `SOPS_AGE_KEY_FILE` variable in your `bashrc`, `zshrc` or `config.fish` and source it, e.g.

```sh
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
source ~/.bashrc
```


### 🔹 GitOps with Flux

Here we will be installing [flux](https://toolkit.fluxcd.io/) after some quick bootstrap steps.

1. Verify Flux can be installed

```sh
flux --kubeconfig=./provision/kubeconfig check --pre
# ► checking prerequisites
# ✔ kubectl 1.21.5 >=1.18.0-0
# ✔ Kubernetes 1.21.5+k3s1 >=1.16.0-0
# ✔ prerequisites checks passed
```

2. Pre-create the `flux-system` namespace

```sh
kubectl --kubeconfig=./provision/kubeconfig create namespace flux-system --dry-run=client -o yaml | kubectl --kubeconfig=./provision/kubeconfig apply -f -
```

3. Add the Age key in-order for Flux to decrypt SOPS secrets

```sh
cat ~/.config/sops/age/keys.txt |
    kubectl --kubeconfig=./provision/kubeconfig \
    -n flux-system create secret generic sops-age \
    --from-file=age.agekey=/dev/stdin
```

📍 Variables defined in `./cluster/base/cluster-secrets.sops.yaml` and `./cluster/base/cluster-settings.yaml` will be usable anywhere in your YAML manifests under `./cluster`

4. **Verify** the `./cluster/base/cluster-secrets.sops.yaml` and `./cluster/core/cert-manager/secret.sops.yaml` files are **encrypted** with SOPS

5. If you verified all the secrets are encrypted, you can delete the `tmpl` directory now

6. Push you changes to git

```sh
git add -A
git commit -m "initial commit"
git push
```

7. Add a Github SSH key for Flux

   1. Create a new ssh key for Flux to use exclusively.

   ```sh
   ssh-keygen -t ed25519 -C "<computername>@hello@iwrite.software"
   ```

   2. Add the key to your Github SSH Keystore

   3. Provide flux with the SSH key.

   ```sh
   flux -n flux-system create secret git flux-system \
       --url=ssh://git@github.com/sparksd2145/flux-infra \
       --ssh-key-algorithm=ed25519 \
       --private-key-file=./private.key
   ```

8. Install Flux

📍 Due to race conditions with the Flux CRDs you will have to run the below command twice. There should be no errors on this second run.

```sh
kubectl --kubeconfig=./provision/kubeconfig apply --kustomize=./cluster/base/flux-system
# namespace/flux-system configured
# customresourcedefinition.apiextensions.k8s.io/alerts.notification.toolkit.fluxcd.io created
# ...
# unable to recognize "./cluster/base/flux-system": no matches for kind "Kustomization" in version "kustomize.toolkit.fluxcd.io/v1beta1"
# unable to recognize "./cluster/base/flux-system": no matches for kind "GitRepository" in version "source.toolkit.fluxcd.io/v1beta1"
# unable to recognize "./cluster/base/flux-system": no matches for kind "HelmRepository" in version "source.toolkit.fluxcd.io/v1beta1"
# unable to recognize "./cluster/base/flux-system": no matches for kind "HelmRepository" in version "source.toolkit.fluxcd.io/v1beta1"
# unable to recognize "./cluster/base/flux-system": no matches for kind "HelmRepository" in version "source.toolkit.fluxcd.io/v1beta1"
# unable to recognize "./cluster/base/flux-system": no matches for kind "HelmRepository" in version "source.toolkit.fluxcd.io/v1beta1"
```

8. Verify Flux components are running in the cluster

```sh
kubectl --kubeconfig=./provision/kubeconfig get pods -n flux-system
# NAME                                       READY   STATUS    RESTARTS   AGE
# helm-controller-5bbd94c75-89sb4            1/1     Running   0          1h
# kustomize-controller-7b67b6b77d-nqc67      1/1     Running   0          1h
# notification-controller-7c46575844-k4bvr   1/1     Running   0          1h
# source-controller-7d6875bcb4-zqw9f         1/1     Running   0          1h
```
