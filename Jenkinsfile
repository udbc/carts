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
        echo 'Building..'
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
        echo 'Testing'
        sh 'mvn clean test'
      }
    }

    stage('Packaging') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Packaging....'
        sh 'mvn package -DskipTests'
        archiveArtifacts '**/target/*.jar'
      }
    }

    stage('Docker build and publish') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("kumar123/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  tools {
    maven 'Maven 3.6.3'
  }
  post {
    always {
      echo 'this pipeline has completed'
    }

  }
}