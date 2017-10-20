pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'latexmk -pdf -xelatex cv.tex'
      }
    }
    stage('deploy') {
      steps {
        sh 'cp cv.pdf /srv/http/www/cv.pdf'
      }
    }
  }
}
