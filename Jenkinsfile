pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Compilation'
        sh 'mvn compile'
      }
    }

    stage('Validate') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Validation'
        sh 'mvn clean test'
      }
    }

    stage('Package') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Packaging'
        sh 'mvn package -DskipTests'
      }
    }

    stage('') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("sanjaygeeky/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")}
          }

        }
      }

    }
    tools {
      maven 'Maven3.6.3'
    }
  }