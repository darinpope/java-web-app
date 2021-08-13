pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Build') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') { 
          sh './mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2144:sonar'
        }
      }
    }
  }
}