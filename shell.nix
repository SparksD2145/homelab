{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    kubectl
    krew
    kubernetes-helm
    fluxcd
    ansible
    opentofu
    kustomize
    gitleaks
    ipmitool
    sops
    age
    pre-commit
    go
    go-task
  ];

  # env.VAR = "${VAR}";
}
