# Remove Docker Tag Action

This GitHub action removes a Docker tag from the GitHub Container Registry package repository. It is a workaround for the current lack of API implementation of this feature in GHCR. 

Deleting tags is described in the Docker Registry specification: https://github.com/opencontainers/distribution-spec/blob/main/spec.md#deleting-tags.

Discussion link: https://github.com/orgs/community/discussions/26267.


## How it works
Action creates and pushes a dummy Docker image to the registry with a given tag so that the tag is separated from other images, and then deletes the dummy image.

# Usage

<!-- start usage -->
```yaml
- uses: rafalkk/remove-dockertag-action@v1
  with:
    # Name of the Docker tag to delete.
    # (required)
    tag_name: ''

    # Token is required to log in to the Container Registry and use the GitHub API.
    # (required)
   github_token: ''

    # Set this to `true` if you are using it within an organization.
    # Organization accounts have different API endpoints.
    # (optional)
    # default: false
   is_organization: ''
   

```
#### Private Repository Inputs (optional, for private repositories only)
Action can be stored in a private repository, if so, you will need to use the following entries
```yaml
    # Repository where the Action is stored.
    # (optional)
    # default: rafalkk/remove-dockertag-action
   private_repo_link: ''

    # Token with access to the private repository.
    # (optional)
   private_repo_token: ''
```
<!-- end usage -->


## Example in workflow

Removes the "main" tag from the repository from which the run was made.

```yaml
name: Remove Docker Tag

on:
    workflow_dispatch:

jobs:
  remove-docker-tag:
    runs-on: ubuntu-latest
    steps:
    - name: Remove Docker Tag
      uses: rafalkk/remove-dockertag-action@v1
      with:
        tag-name: main
        github_token: ${{ secrets.GITHUB_TOKEN }}
```