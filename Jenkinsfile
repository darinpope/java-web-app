pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    STACKHAWK_API_KEY = credentials('stackhawk-api-key')
  }
  stages {
    stage("Run HawkScan Test") {
      steps {
        sh '''
          docker run -v ${WORKSPACE}:/hawk:rw -t \
            -e API_KEY=${STACKHAWK_API_KEY} \
            -e NO_COLOR=true \
            stackhawk/hawkscan
        '''
      }
    }
  }
}