pipeline {
    agent { label "${LABEL_NAME}" }
    stages {
        stage ( 'CODE' ) {
            steps {
                git url:"https://github.com/Huzefa211/agentdocker.git" , branch: "main"                 
            }
        }
        stage ( 'build' ) {
             steps {
                 sh "docker build -t simpleapp:1 ."
             }
        }   
        
         stage ('deploy') {
               steps {
                   sh "docker stop c1 || true"
                   sh "docker rm c1 || true"
                   sh "docker run -d --name c1 -p 80:80 simpleapp:1 sleep infinity"
                   
               }
    }
}
}
