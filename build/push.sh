docker push "us.icr.io/dalehille/webapp:${TRAVIS_TAG}" &&

curl --request POST
       --url ${RAZEE_API}/api/v1/channels/${RAZEE_CHANNEL}/version
       --header 'content-type: text/yaml'
       --header 'razee-org-key: ${RAZEE_ORG_KEY}'
       --header 'resource-description: ${TRAVIS_COMMIT_MESSAGE}'
       --header 'resource-name: ${TRAVIS_TAG}'
       --header 'x-api-key: ${X_API_KEY}'
       --header 'x-user-id: ${X_USER_ID}'
       --data @/tmp/resource.yaml
