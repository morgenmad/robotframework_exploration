pipeline {
    agent any

    environment {
        TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5hbnQiOiJiNmNhZGQwNS1lMzQxLTNmMTctYjU1Zi00OTM0MTI4MWQ4MmEiLCJhY2NvdW50SWQiOiI3MDEyMToyNTFlNzRkOC05M
2E4LTQyNWItYTk3NC02NTBiMjg3YTI0NmQiLCJpc1hlYSI6ZmFsc2UsImlhdCI6MTc3MDgwNzMzOCwiZXhwIjoxNzcwODkzNzM4LCJhdWQiOiJFNkRGMEUxQjJDRDM0RjdFQUE3Q0ZBQUMwNjJFOThEQyIsImlzcyI6ImNvbS54cGFuZGl0LnBsdWdpbnMueHJheSIsInN1YiI6IkU2REYwRTFCMkNEMzRGN0VBQTdDRkFBQzA2MkU5OERDIn0.JjubJbPrXfVtdtsFEn4S1jAmxFxeNZTZnbX7HZeJ5to"
    }
    
    stages {

        stage('Installation des dependances') {
            steps {
                bat 'pip3 install -r requirements.txt'
            }
        }

        stage('Execution des tests') {
            steps {
                bat 'robot .'
            }
        }
    }
}