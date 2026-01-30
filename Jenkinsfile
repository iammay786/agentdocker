pipeline {
    agent { label "${LABEL_NAME}" }
    enviroment {
        IMAGE_NAME = "simpleapppp"
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_IMAGE = "${IMAGE_NAME}:${IMAGE_TAG}"
    }
    stages {
        stage ( 'CODE' ) {
            steps {
                git url:https:"//github.com/iammay786/agentdocker.git" , branch: "main"                 
            }
        }
        stage ( 'build' ) {
             steps {
                 sh "docker build -t ${DOCKER_IMAGE} ."
             }
        }   
        
         stage ('deploy') {
               steps {
                   sh "docker stop c1 || true"
                   sh "docker rm c1 || true"
                   sh "docker run -d --name c1 -p 80:80 ${DOCKER_IMAGE} sleep infinity"
                   
               }
    }
}
}
