#!/usr/bin/bash

GHOSTRESS_ROOT="$GOPATH/src/github.com/titolins/ghostress/"
TEST_DATA_PATH="./data"
GHOSTRESS="$GHOSTRESS_ROOT/ghostress"

if [ $ENV = "golang" ]; then
    PORT=1323
else
    PORT=3001
fi

if [ $USE_DATA ]; then
    DATA_FILE="ghostress_data.json"
else
    DATA_FILE="ghostress_desc.json"
    USE_DATA=false
fi

$GHOSTRESS -use_data_file=$USE_DATA -data="$TEST_DATA_PATH/$DATA_FILE" -uri="http://localhost:$PORT/ghost" -n_req=1000 -method=POST
