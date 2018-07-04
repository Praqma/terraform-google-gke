# This script stores terraform output variables into files and pushes them into a Google Cloud Bucket
# The script Needs gsutils to be installed,  

# The bucket where the certs will be stored. It should be provided in an env variable called 'GCS_KEYS_BUCKET' 
# The format is : gs://bucket-name
bucket=${GCS_KEYS_BUCKET}
# saving the scecrets into files
echo "Importing keys from terraform into local files for k8s cluster ... "

mkdir keys
# base64 -d doesn't work on Mac, use -D instead
echo $(terraform output cluster_client_certificate) | base64 -d > keys/client_certificate.crt
echo $(terraform output cluster_client_key) | base64 -d > keys/client_key.key
echo $(terraform output cluster_ca_certificate) | base64 -d > keys/ca.crt

# push secrets to GCS and cleanup the local file system
if [[ -s keys/client_certificate.crt && -s keys/client_key.key && -s keys/ca.crt ]];then
  echo "Pushing keys to GCS ... "
  if ! gsutil cp -r keys  ${bucket}; then
    exit 1
  else
    echo "Cleaning up local file system ... "
    if ! rm -r keys; then
      echo "Something went wrong during the local file system cleanup. Please clean it up manually."
    else
      echo "Pushed cluster keys successfully to GCS and cleaned local file system."
    fi
  fi

else
  echo "Something went wrong with reading terraform output variables! The files (or some of them) are empty. Deleting local files and aborting!"
  rm -r keys
  exit 1
fi