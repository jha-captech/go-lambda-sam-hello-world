FUNC_NAME=myFunction
FUNC_ROOT_DIR=.\hello-world

VAR=test value
GOOS=linux
GOARCH=amd64
CGO_ENABLED=0


.PHONEY: build-HelloFunc
build-HelloFunc:
	cd $(FUNC_ROOT_DIR) & \
	go build -tags lambda.norpc -o bootstrap cmd/lambda/main.go & \
	echo  "build done"


.PHONEY: zip
zip: build-HelloFunc
	cd $(FUNC_ROOT_DIR) & \
	%USERPROFILE%\Go\bin\build-lambda-zip.exe -o $(FUNC_NAME).zip bootstrap
	echo  "zip done"


.PHONEY: build-container
build-container:
	sam build --use-container


.PHONEY: sam-build
sam-build:
	sam build


.PHONEY: start-api
start-api:
	sam local start-api
