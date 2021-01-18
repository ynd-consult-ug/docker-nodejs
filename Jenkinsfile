#!groovy

IMAGE_BASENAME = 'yndconsult/docker-ruby:'
NODE_VERSIONS  = [
  '10',
  '12',
  '14'
]

CENTOS_VERSIONS = [
  '8'
]

node('ynd') {
  stage('Fetch code') {
    GIT = utils.checkoutRepository('git@github.com:ynd-consult-ug/docker-node.git')
  }

  withDockerRegistry(credentialsId: 'hub.docker.com') {
    CENTOS_VERSIONS.each{ os ->
      NODE_VERSIONS.each { version ->
        IMAGE_NAME = "${IMAGE_BASENAME}${version}"
        stage(IMAGE_NAME) {
          sh "docker build -t ${IMAGE_NAME} -f Dockerfile" +
          " --build-arg DISTRO_VERSION=${os}" +
          " --build-arg NODE_VERSION=${version} ."
        }
        stage("Push ${IMAGE_NAME}") {
          sh "docker push ${IMAGE_NAME}"
        }
      }
    }
  }

  stage('Cleanup') {
    cleanWs()
  }
}
