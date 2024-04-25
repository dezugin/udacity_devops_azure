
# Overview


## Actions Badge

badge->

![img](https://dev.azure.com/odluser258277/udacity/_apis/build/status%2Fdezugin.flascodehugo?branchName=master)

In this project, I built a Github repository from scratch and created a scaffolding that assisted me in performing both Continuous Integration and Continuous Delivery. I used Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Next, I integrated this project with Azure Pipelines to enable Continuous Delivery to Azure App Service.

## Project Plan

* A link to a [Trello](https://trello.com/invite/b/nQ1YXymx/ATTIf919d539bd4a48573232b7e7e532c87459298484/project-management) board for the project
* A link to a [spreadsheet](https://docs.google.com/spreadsheets/d/1FH4DlHbekuHPKbjYGb84ZCZzjj-oKbDDoqqklHm8JzY/edit?usp=sharing) that includes the original and final project plan>

## Instructions


* Architectural Diagram 
![diagram](img/diagram.png)

Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

1. Login in your Azure account
2. From the Azure Console, open the Cloud Shell (Bash) terminal
3. Generate and set up SSH Keys in your azure cloud shell, add them (id_rsa.pub) to your GitHub repository and then clone the project there.
  - `ssh-keygen -t rsa`
  - `cat ~/.ssh/id_rsa.pub`
  - `git clone <repository>`
   


* Project running on Azure App Service

Run `./commands.sh` and change the app name for your own

![cont](img/flascowebapp.png)
![cont](img/flasco2.png)
![cont](img/continuous.png)

![appservices](img/appservices.png)

* Project cloned into Azure Cloud Shell

![cloned](img/cloned.png)

* Passing tests that are displayed after running the `make all` command from the `Makefile` with a test run
![make](img/make1.png)
![make](img/make2.png)
![make](img/make3.png)
![make](img/make4.png)

* Successful deploy of the project in Azure Pipelines and running it.

Screenshot of azure pipelines:

![pipeline](img/pipeline.png)


* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).

![prediction](img/prediction.png)

* Output of streamed log files from deployed application

![log](img/logfiles.png)

## Enhancements

More emphasis should be given to debugging applications through log files, after I started doing it I took minutes on what took hours before.
## Locust testing
- Execute a Load Testing, running Locust with `./locust.sh`.
![img2](img/locust1.png)

![img3](img/locust2.png)

![img4](img/locust3.png)

![img5](img/locust4.png)

![img6](img/locust5.png)

![img7](img/locust6.png)


## Screenshot of App Services

![img8](img/ssappservices.png)

## Screenshot of Azure Pipelines

![img7](img/sspipeline.png)

![img7](img/sspipeline2.png)

![img7](img/sspipeline3.png)

## Demo 

A link to a [Screencast](https://www.youtube.com/watch?v=E4mO23dOGpE) on YouTube!


