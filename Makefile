TARGET="cv.agnesepoikane.com"
SOURCE="`pwd`/public/"

.PHONY: all clean build upload
all: clean build upload

clean:
	@rm -rf public/

build:
	@hugo -D

upload:
	@lftp -e "set ssl:verify-certificate no; mirror -R --delete ${SOURCE} ${TARGET}; bye" -u "${USER}","${PASS}" "${HOST}"

