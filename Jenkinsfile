pipeline {
  agent docker
  stages {
    stage('tf-step') {
      agent {
        docker {
          image 'ubuntussh:v2'
          args '-p 2223:22'
        }

      }
      steps {
        sh '''pwd
hostname
ifconfig'''
      }
    }
  }
}