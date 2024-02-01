def call(String projectKey, String serverUrl, String sonarToken) {
    // Your SonarQube analysis steps here
    // ...

     // Run SonarQube analysis
                       // sh "chmod +x./gradlew sonar -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_SERVER_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.scm.provider=git"
                        // Grant execute permissions to the gradlew script
                         sh 'chmod +x /var/lib/jenkins/workspace/deployAndTestMultiCloudPipeline/gradlew'

                          // Run the gradlew script with SonarQube analysis
                          sh "/var/lib/jenkins/workspace/deployAndTestMultiCloudPipeline/gradlew sonar -Dsonar.projectKey=${SONAR_PROJECT_KEY} -Dsonar.host.url=${SONAR_SERVER_URL} -Dsonar.login=${SONAR_TOKEN} -Dsonar.scm.provider=git"
}
