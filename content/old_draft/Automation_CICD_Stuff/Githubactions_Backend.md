+++
title = 'Githubaction backend'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['git', 'githubactions', 'CI/CD', 'automation CI/CD stuff']
+++
# Githubaction backend

Just notes from my demo, What's behind abstraction, Githubaction backend

```powershell
#!/bin/bash
IMAGE='ghcr.io/actions/jekyll-build-pages:v1.0.8'
DOCKER_OPTIONS=(--name ghcrioactionsjekyllbuildpagesv108_358abc --label 2a6c8c --workdir /github/workspace --rm -e "INPUT_SOURCE" -e "INPUT_DESTINATION" -e "INPUT_FUTURE" -e "INPUT_BUILD_REVISION" -e "INPUT_VERBOSE" -e "INPUT_TOKEN" -e "HOME" -e "GITHUB_JOB" -e "GITHUB_REF" -e "GITHUB_SHA" -e "GITHUB_REPOSITORY" -e "GITHUB_REPOSITORY_OWNER" -e "GITHUB_REPOSITORY_OWNER_ID" -e "GITHUB_RUN_ID" -e "GITHUB_RUN_NUMBER" -e "GITHUB_RETENTION_DAYS" -e "GITHUB_RUN_ATTEMPT" -e "GITHUB_REPOSITORY_ID" -e "GITHUB_ACTOR_ID" -e "GITHUB_ACTOR" -e "GITHUB_TRIGGERING_ACTOR" -e "GITHUB_WORKFLOW" -e "GITHUB_HEAD_REF" -e "GITHUB_BASE_REF" -e "GITHUB_EVENT_NAME" -e "GITHUB_SERVER_URL" -e "GITHUB_API_URL" -e "GITHUB_GRAPHQL_URL" -e "GITHUB_REF_NAME" -e "GITHUB_REF_PROTECTED" -e "GITHUB_REF_TYPE" -e "GITHUB_WORKFLOW_REF" -e "GITHUB_WORKFLOW_SHA" -e "GITHUB_WORKSPACE" -e "GITHUB_ACTION" -e "GITHUB_EVENT_PATH" -e "GITHUB_ACTION_REPOSITORY" -e "GITHUB_ACTION_REF" -e "GITHUB_PATH" -e "GITHUB_ENV" -e "GITHUB_STEP_SUMMARY" -e "GITHUB_STATE" -e "GITHUB_OUTPUT" -e "RUNNER_OS" -e "RUNNER_ARCH" -e "RUNNER_NAME" -e "RUNNER_ENVIRONMENT" -e "RUNNER_TOOL_CACHE" -e "RUNNER_TEMP" -e "RUNNER_WORKSPACE" -e "ACTIONS_RUNTIME_URL" -e "ACTIONS_RUNTIME_TOKEN" -e "ACTIONS_CACHE_URL" -e "ACTIONS_ID_TOKEN_REQUEST_URL" -e "ACTIONS_ID_TOKEN_REQUEST_TOKEN" -e GITHUB_ACTIONS=true -e CI=true)
DOCKER_MOUNTS=(-v "/var/run/docker.sock":"/var/run/docker.sock" -v "/home/runner/work/_temp/_github_home":"/github/home" -v "/home/runner/work/_temp/_github_workflow":"/github/workflow" -v "/home/runner/work/_temp/_runner_file_commands":"/github/file_commands" -v "/home/runner/work/adrianbiro.github.io/adrianbiro.github.io":"/github/workspace")
REPOPATH='/home/runner/work/adrianbiro.github.io/adrianbiro.github.io'
REMOTE_OIGIN=' https://github.com/adrianbiro/adrianbiro.github.io'
BRANCH='main'

docker pull "${IMAGE}"
git version
git config --global --add safe.directory "${REPOPATH}"
git init "${REPOPATH}"
git remote add origin "${REMOTE_OIGIN}"
git config --local gc.auto 0
#https://git-scm.com/docs/git-gc#Documentation/git-gc.txt-gcauto
git config --local --name-only --get-regexp core\.sshCommand
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
: <<'END_COMMENT'
Authentification github specific https://github.com/actions/checkout/issues/162
git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
END_COMMENT
git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin +refs/heads/"${BRANCH}"*:refs/remotes/origin/"${BRANCH}"* +refs/tags/"${BRANCH}"*:refs/tags/"${BRANCH}"*
git branch --list --remote origin/"${BRANCH}"
git checkout --progress --force -B "${BRANCH}" refs/remotes/origin/"${BRANCH}"
: <<'END_COMMENT'
Authentification github specific
git config --global http.https://github.com/.extraheader AUTHORIZATION: basic ***
git config --global --unset-all url.https://github.com/.insteadOf
git config --global --add url.https://github.com/.insteadOf git@github.com:
END_COMMENT
git submodule sync --recursive
git -c protocol.version=2 submodule update --init --force --depth=1 --recursive
: <<'END_COMMENT'
https://opensource.googleblog.com/2018/05/introducing-git-protocol-version-2.html
https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-update--init--remote-N--no-fetch--no-recommend-shallow-f--force--checkout--rebase--merge--referenceltrepositorygt--depthltdepthgt--recursive--jobsltngt--no-single-branch--filterltfilterspecgt--ltpathgt82308203
https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-init--ltpathgt82308203
Create a shallow clone with a history truncated to one https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt---depth   
END_COMMENT
git submodule foreach --recursive git config --local gc.auto 0
: <<'END_COMMENT'
Authentification github specific
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'url\.https\:\/\/github\.com\/\.insteadOf' && git config --local --unset-all 'url.https://github.com/.insteadOf' || :"
git submodule foreach --recursive sh -c "git config --local 'http.https://github.com/.extraheader' 'AUTHORIZATION: basic ***' && git config --local --show-origin --name-only --get-regexp remote.origin.url"
git submodule foreach --recursive git config --local --add 'url.https://github.com/.insteadOf' 'git@github.com:'
END_COMMENT
git log -1 --format='%H'
docker run "${DOCKER_OPTIONS}" "${DOCKER_MOUNTS}" "${IMAGE}"
git version
git config --global --add safe.directory "${REPOPATH}"
git config --local --name-only --get-regexp core\.sshCommand
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
: <<'END_COMMENT'
Authentification github specific
git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
git config --local --unset-all http.https://github.com/.extraheader
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
END_COMMENT
```
