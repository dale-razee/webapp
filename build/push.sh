#/bin/sh
# cat /tmp/resource.yaml

echo 
set -x 

curl --verbose \
     --url "${RAZEE_API}/graphql" \
     --header "content-type: multipart/form-data" \
     --header "x-api-key: ${X_API_KEY}" \
     --form 'operations={
    "query": "mutation addChannelVersion($org_id:String!, $channel_uuid:String!, $name:String!, $type:String!, $file:Upload!, $description:String) {\n  addChannelVersion(org_id:$org_id,channel_uuid:$channel_uuid, name:$name, type:$type, file:$file, description:$description){\n    success\n    version_uuid\n  }\n}",
    "variables": {
      "org_id": ${ORG_ID},
      "channel_uuid": ${CHANNEL_ID},
      "name": ${VERSION},
      "type": "application/yaml",
      "file": null,
      "description": null
    },
    "operationName": "addChannelVersion"
  }' \
    --form 'map={"localfile":["variables.file"]}' \
    --form localfile=@/tmp/resource.yaml

echo $?
