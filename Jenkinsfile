pipeline {
    agent { label "${LABEL_NAME}" }
    environment {
        IMAGE_NAME = "simpleapppp"
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_IMAGE = "${IMAGE_NAME}:${IMAGE_TAG}"
    }
    stages {
        stage ( 'CODE' ) {
            steps {
                git url:"https://github.com/iammay786/agentdocker.git" , branch: "main"                 
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
    post {
emailext { body: '''THIS BUILD IS REGARDING THE FAILED BUILD
for refernce check console output of $(build_number)''', 
    subject: 'Build FAILED $(BUILD_NUMBER)',
    to: 'mra582562@gmail.com'
         }
         }
}
