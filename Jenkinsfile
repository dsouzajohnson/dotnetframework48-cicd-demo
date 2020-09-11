pipeline {
  agent any
   stages {
    stage('Checkout'){
      steps {
        checkout scm

      }
    }
    
    stage('Nuget Restore') {
      steps {
        bat label: 'Nuget Restore', 
        script: '''
          nuget restore "dotnetframework48-cicd-demo.sln"
          echo "Nuget Done Starting Msbuild *************"
        ''' 
      }
    }

    stage('Build') {
      steps {
       script {
		  //def msbuild = tool name: 'msbuild_2017', type: 'hudson.plugins.msbuild.MsBuildInstallation'
		  tool name: 'msbuild_2019', type: 'msbuild'
		  bat "\"${tool 'msbuild_2019'}\" dotnetframework48-cicd-demo.sln"
		}
      	}
    }

    stage('UnitTest') {
      steps {
        	echo 'Step Unit Test Project'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Step Deploy Project'
      }
    }
  }
}
