# puskerit
Docker image to push git repo to a remote

This GitLab CI runner image allows to deploy a GitLab project to a remote Git repo (useful for Dokku, Heroku, Deis, etc.)

## How to use

### With GitLab CI/CD:
Create `.gitlab-ci.yml`:

```yaml
image: nampdn/puskerit

stages:
  - deploy

deploy to production:
  stage: deploy
  environment: production
  only:
    - master
  script: puskerit dokku@dokku.me:myapp
```

Go to GitLab > Project > Settings > CI/CD > Secret Variables, and add a variable `SSH_PRIVATE_KEY`:

```
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
```

### Pushing to a branch other than master

By default, `puskerit` will push to branch `master` of a remote repository (that's what Dokku wants). You can override this with:

```console
puskerit user@git.host:repo branch
```

### Pushing to Git running on a non-standard port

```console
puskerit ssh://dokku@dokku.me:8022/myapp
```

### Not doing force push

By default, git push will be forced. You can disable force push by setting environment variable `DISABLE_FORCE_PUSH` to any value.
