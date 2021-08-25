#!/bin/sh

aws s3 cp ../files/index.html s3://www.nrmh.lock11.com.au/index.html \
	--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers \
	--exclude ".git*" 

aws s3 cp ../files/error.html s3://www.nrmh.lock11.com.au/error.html \
	--grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers \
	--exclude ".git*" 
