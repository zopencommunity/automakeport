node('linux') 
{
        stage ('Poll') {
                checkout([
                        $class: 'GitSCM',
                        branches: [[name: '*/main']],
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        userRemoteConfigs: [[url: 'https://github.com/ZOSOpenTools/automakeport.git']]])
        }

        stage('Build') {
                build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'automakeport'), string(name: 'DESCRIPTION', value: 'GNU Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards.' )]
        }
}
