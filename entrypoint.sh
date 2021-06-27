echo "${GITHUB_CRED}"
apk add git
touch ~/.git-credentials
echo "${GITHUB_CRED}" >> ~/.git-credentials
git config --global credential.helper store
cd /app
npm i --production
node main.js
