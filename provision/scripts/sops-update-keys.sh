find ./hosts/ -name '*sops*.yaml' -exec sops updatekeys {} \;
