# save this as shell.nix
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
  ];

  # env.VAR = "${VAR}";
}
