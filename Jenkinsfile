pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'latexmk -pdf -xelatex cv-full.tex'
      }
    }
    stage('deploy') {
      steps {
        sh 'cp cv-full.pdf /var/lib/containers/barrucadu/srv/http/www/cv.pdf'
      }
    }
  }
}
