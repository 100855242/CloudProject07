#!/bin/sh

# Name of SSH key required to download Git repo
KEYNAME="id_rsa"

# Path to KEYNAME in S3 bucket (bucket name + directory/ies)
BUCKET="nrmh.files"

# URI to GitHub account
GITACCOUNT="git@github.com:mjhalldotorg"

# Name of repo we're tracking
REPONAME="cp07"

# Local destination directory for repo files
DESTDIR="/usr/share/nginx/html"

# The function that synchronises the files in the repository
# with the web server's docroot directory.
function update_code() {
    
    cp index.html ${DESTDIR}
    #rsync -a --exclude={'cfg.sh','.git*','README.md','LICENCE'} ./* ${DESTDIR}    
    
}

# Basic script logic.
# Clone or update the repo we're tracking, then update web server files.
if [ ! -d "/home/ec2-user/${REPONAME}" ]; then

	aws s3 cp "s3://${BUCKET}/${KEYNAME}" "/home/ec2-user/.ssh/${KEYNAME}"
	chmod 400 "/home/ec2-user/.ssh/${KEYNAME}"
	
	git clone "${GITACCOUNT}/${REPONAME}.git"
	cd ${REPONAME}
	sudo update_code

else

	cd "${REPONAME}"
	git pull
	sudo update_code

fi
