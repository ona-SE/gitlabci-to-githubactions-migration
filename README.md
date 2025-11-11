# Gitlab CI to GitHub Action migration demo. 

Ona Prompt: 
```
I want to migrate a GitLab CI pipeline to GitHub. 

Please do the following: Migrate the GitLab pipeline to GitHub actions, push the changes to a feature branch and create a new draft PR. Do not use the remote version of an existing branch. Run the GitHub actions workflow on the feature branch you created and iterate until it succeeds.

Migration instructions:
* Follow the best practices: https://docs.github.com/en/actions/tutorials/migrate-to-github-actions/manual-migrations/migrate-from-gitlab-cicd
* Make intelligent decisions on whether GitLab jobs should be migrated to GitHub Action "steps" or GitHub Action "jobs":
If the Gitlab Job's purpose is to make preparations for dependent jobs, make it a GitHub Action "step".
Otherwise, make it a GitHub Action "Job".
```
