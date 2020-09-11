pipeline {
  agent any
     
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
        script {
          bat label: 'Unit Test using Dotnet CLI',
        script: '''
          //dotnet.exe test .\\dotnetframework48-cicd-demo\\
        '''
        }
      }
    }

    stage('Deploy') {
      steps {
        bat label: 'MsDeploy',
        script: ''' 
          // For Localhost
          //"C:\\Program Files (x86)\\IIS\\Microsoft Web Deploy V3\\msdeploy.exe" -verb:sync -source:package="PrimeDotnet\\bin\\Debug\\Package\\dotnetframework48-cicd-demo.zip" -dest:auto,computerName=localhost
          // For Remote Server
           //"C:\\Program Files (x86)\\IIS\\Microsoft Web Deploy V3\\msdeploy.exe" -verb:sync -source:package="PrimeDotnet\\obj\\Debug\\Package\\dotnetframework48-cicd-demo.zip" -dest:auto,computerName="<IP or Hostname>",userName=administrator,password="supersecret",authType=NTLM -allowUntrusted=true
        '''
      }
    }
  }
}
