# github-actions-controller

## Requirements
 - Must have Admin permissions on org/ent/project to register
 - Must use fine-grained PATs


## Auth NOtes
https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/managing-access-to-self-hosted-runners-using-groups#about-runner-groups

Need a PAT with
 - admin:org scope
 - manage_runners:enterprise scope


### Create App, must be used w/ groups for enterprise
https://docs.github.com/en/apps/creating-github-apps/registering-a-github-app/registering-a-github-app

### Create runner groups, needed only for Enterprise
https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/managing-access-to-self-hosted-runners-using-groups#about-runner-groups

### Authenticating ARC with GitHub App
https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/authenticating-to-the-github-api#authenticating-arc-with-a-github-app


### Create and Deploy runner w/ Secret
```
apiVersion: v1
kind: Secret
metadata:
  name: github-app-secret
type: Opaque
stringData:
  github_app_id: "99999"
  github_app_installation_id: "99999"
  github_app_private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    MII...
    -----END RSA PRIVATE KEY-----
```

### Runner values.yaml
https://github.com/actions/actions-runner-controller/blob/master/charts/gha-runner-scale-set/values.yaml


## Custom Containers
