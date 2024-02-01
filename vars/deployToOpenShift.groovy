def call(String openshiftSecret, String openshiftServer, String openshiftProject,
         String appServiceName, String appImage, String appPort) {
    // Your OpenShift deployment steps here
    // 
          withCredentials([string(credentialsId:"${openshiftCredentialsID}", variable: 'OPENSHIFT_SECRET')]) {
                    sh "oc login --token=\${OPENSHIFT_SECRET} --server=\${OPENSHIFT_SERVER} --insecure-skip-tls-verify"
                    }
                    sh "oc project \${OPENSHIFT_PROJECT}"
                    //sh "oc delete dc,svc,deploy,ingress,route \${DOCKER_IMAGE} || true"
                    sh "oc new-app ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp} --token=\${OPENSHIFT_SECRET}"
                    
                    // Expose the service 
                    sh "oc create service clusterip ${APP_SERVICE_NAME} --tcp=8080:8080 "
                    sh " oc expose service/${APP_SERVICE_NAME}"
                    
                    //sh "oc create route edge --service \${APP_SERVICE_NAME} --port \${APP_PORT} --hostname springboot.apps.ocpuat.devopsconsulting.org --insecure-policy Redirect"

                }
         
}
