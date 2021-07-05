# Steps to create Github Webhook
## 1.	Create GitHub Access Token
Create your GitHub access token with the following access: public_repo, admin:repo_hook
Once you have created the token, add it to the Secret `github-webhooks/webhook-secret.yaml`

## 2.	Configure Webhook for Hello World App
Update the TaskRun `github-webhooks/create-repo-webhook-run.yaml` with the following information with respect to your setup.
```
GitHubOrg: your GitHub username (or your GitHub org name, depending on where your cloned your repository)
GitHubUser: your GitHub username
GitHubRepo: your repository name
ExternalDomain: The URL of the Route we created in the above section. Run `oc get route sample-webapp-eventlistener` to find the host URL for the route.
```

## 3.	Instantiate TaskRun to create webhook
```
oc apply -f create-webhook-user.yaml
oc apply -f webhook-secret.yaml
oc apply -f create-webhook-task.yaml
oc apply -f create-repo-webhook-run.yaml
```

## 4.	Verify if the webhook was created
You should see a webhook configured in your fork of source code repository (on our GitHub Repo, go to Settings>Webhooks).
