
docker push "us.icr.io/dalehille/webapp:${VERSION}" 

cat /tmp/resource.yaml

      #  --header "resource-description: ${TRAVIS_COMMIT_MESSAGE}" \
echo 
set -x 
curl --verbose \
       --url "${RAZEE_API}/api/v1/channels/${RAZEE_CHANNEL}/version" \
       --header "content-type: text/yaml" \
       --header "razee-org-key: ${RAZEE_ORG_KEY}" \
       --header "resource-name: ${VERSION}" \
       --header "x-api-key: ${X_API_KEY}" \
       --header "x-user-id: ${X_USER_ID}" \
       --data-binary @/tmp/resource.yaml

echo $?
