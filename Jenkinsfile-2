node {
stage('SCM')
{
checkout scm
}
stage('SonarQube Analysis')
{
def scannerHome = tool 'sonarqubedemo';
withSonarQubeEnv()
{
bat "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=sonarqubedemo"
}
}
stage("Build Result")
{
echo "Build Successful"
}
}
