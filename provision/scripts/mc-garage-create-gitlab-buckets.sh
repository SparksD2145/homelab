# Perform the following command first:
# mc alias set garage http://12.34.56.78:9000 ACCESS_KEY SECRET_KEY

buckets=("git-lfs" "gitlab-agent-plan-content" "gitlab-artifacts" "gitlab-backups" \
         "gitlab-ci-secure-files" "gitlab-dependency-proxy" "gitlab-mr-diffs" \
         "gitlab-packages" "gitlab-pages" "gitlab-terraform-state" "gitlab-uploads" \
         "registry" "runner-cache" "tmp" )
for bucket in "${buckets[@]}"; do
   mc mb "garage/${bucket}";
done
