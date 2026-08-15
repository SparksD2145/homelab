{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    # Kubernetes
    kubectl
    krew
    kubernetes-helm
    kustomize
    fluxcd

    # Infrastructure
    ansible
    opentofu
    ipmitool
    minio-client
    kopia

    # Utilities
    gitleaks
    sops
    age
    go-task
    pre-commit
    jq
    yq

    # Nix
    nix-output-monitor
    nixfmt
    nil
  ];

  # env.VAR = "${VAR}";
}
