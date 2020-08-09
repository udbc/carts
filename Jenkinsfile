pipeline {
  agent none
  stages {
    stage('Compile') {
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

    stage('Test') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        sh 'mvn test'
      }
    }

    stage('Package') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        sh 'mvn package -DskipTests'
      }
    }

    stage('DockerPublish') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("sanjaygeeky/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  tools {
    maven 'Maven3.6.3'
  }
  post {
    always {
      echo 'this pipeline has completed...'
    }

  }
}