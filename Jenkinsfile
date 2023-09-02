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
        echo 'Packaging....'
        sh 'mvn -DskipTests package'
        archiveArtifacts '**/target/*.jar'
      }
    }

    stage('docker build and publish') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("subbu26/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")

          }
        }

      }
    }

  }
}
