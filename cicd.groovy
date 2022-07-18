node('linux') 
{
        stage('Build') {
                build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'automakeport'), string(name: 'DESCRIPTION', 'GNU Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards.' )]
        }
}
