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
        sh 'cp cv-full.pdf /srv/http/barrucadu.co.uk/www/cv.pdf'
      }
    }
  }
}
