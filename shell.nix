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

    # Utilities
    gitleaks
    sops
    age
    go-task
    pre-commit
    kopia
    jq
    yq

    # Nix
    nix-output-monitor
    nixfmt
    nil
  ];

  # env.VAR = "${VAR}";
}
