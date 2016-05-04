BUILD=./build
SRC=${BUILD}/prj/
#DEST_HOST="root@vlabs-dev.vlabs.ac.in"
DEST_HOST_STAGE="root@10.4.15.101"
DEST_DIR="/var/www/"
REMOVE_COMMAND="rm -rf /var/www/*"




all:  publish

publish: 
	emacs --script elisp/prj.el

clean:
	rm -rf ${BUILD}

pull:
	git pull origin develop

#export: pull publish
#	ssh -o "StrictHostKeyChecking no" ${DEST_HOST} ${REMOVE_COMMAND}
#	rsync -avz --progress ${SRC} ${DEST_HOST}":"${DEST_DIR}

stage: 	publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST_STAGE} ${REMOVE_COMMAND}
	rsync -avz --progress ${SRC} ${DEST_HOST_STAGE}":"${DEST_DIR}

