def call(String imageName, String registry, String imageTag) {
    // Your Docker build and push steps here
     withCredentials([usernamePassword(credentialsId:"${dockerHubCredentialsID}", usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
                    script {
                        
                            sh "echo \${DOCKER_REGISTRY_PASSWORD} | docker login -u \${DOCKER_REGISTRY_USERNAME} --password-stdin"
                            sh "docker build -t ${imageNameapp} ."
                            sh "docker tag ${imageNameapp} ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp}"
                            sh "docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${imageTagApp}"
                         
                            // Clean up even if the build or push fails
                            sh "docker rmi -f ${imageNameapp}"
                        
    
}
