#!groovy
properties([
  buildDiscarder(
    logRotator(numToKeepStr: '5')
  ),
  disableResume(),
  pipelineTriggers([
    githubPush(),
  ])
])

IMAGE_BASENAME = 'yndconsult/docker-nodejs:'
NODE_VERSIONS  = [
  '10',
  '12',
  '14'
]

node('ynd') {
  stage('Fetch code') {
    GIT = utils.checkoutRepository('git@github.com:ynd-consult-ug/docker-nodejs.git')
  }

  TAG  = (new Date()).format('YYYYMMdd')

  try {
    stage('Hadolint checks') {
      security.hadolintChecks('Dockerfile')
    }
  } catch(err) {
      stage('Send slack notification') {
        slackSend channel: '#ops-notifications', message: "Build failed: ${env.JOB_NAME}. Hadolint checks failed. See logs for more information. <${env.BUILD_URL}>", color: 'danger'
      }
      error "Hadolint checks failed. ${err}" 
  }

  if(env.BRANCH_NAME == 'master') {
    withDockerRegistry(credentialsId: 'hub.docker.com') {
      NODE_VERSIONS.each { version ->
        COMPOSE_COMMAND = 'docker-compose -f docker-compose.yml -p docker-nodejs'
        IMAGE_NAME = "node${version}"
        stage(IMAGE_NAME) {
          sh "${COMPOSE_COMMAND} build ${IMAGE_NAME}"
        }
        stage("Push ${IMAGE_NAME}") {
          sh "${COMPOSE_COMMAND} push ${IMAGE_NAME}"
        }
      }
    }

    stage('Create tag in git') {
      if(!git.tagExists(TAG)) {
        git.pushTag(TAG)
      } else {
        echo 'Not pushing tag as it already exists'
      }
    }

    stage('Cleanup') {
      cleanWs()
    }
  }
}
