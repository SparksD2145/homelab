restic_defaults=`sops decrypt 'cluster/core/storage/backup/volsync/restic-defaults.sops.yaml'`

candidates=`find ./cluster/apps/ -name 'restic-*sops*'`
for path in $candidates; do
    if [[ `sops filestatus $path | jq '.encrypted'` == "false" ]]; then
        echo "$path is not sops encrypted! Encrypting now.";
        sops encrypt -i $path;
    fi

    # Update Name
    PVC_DIR_NAME=`sops decrypt $path | yq -r '.stringData.PVC_DIR_NAME'`
    SUBSTITUTION=`sed "s/__NAME__/${PVC_DIR_NAME}/gi" <<< $restic_defaults`

    # Update Namespace
    PVC_NAMESPACE=`sops decrypt $path | yq -r '.stringData.PVC_NAMESPACE'`
    SUBSTITUTION=`sed "s/__NAMESPACE__/${PVC_NAMESPACE}/gi" <<< $SUBSTITUTION`

    # Write in-memory values to file, preventing disk wear
    SUBSTITUTION=`sops encrypt --filename-override 'cluster/test.sops.yaml' <<< $SUBSTITUTION`
    echo "$SUBSTITUTION" > $path
done
