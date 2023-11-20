#!/usr/bin/tcsh

set DATABASES_PATH = "../datasets"
set DATABASE_ID = "dataset_exp08_nym-binaries-v1.1.13_static-http-download_filtered-to-start-end"
# set DATABASE_ID = "dataset_exp07_nym-binaries-1.0.2_static-http-download_network-delay_filtered-to-start-end"
# set DATABASE_ID = "dataset_exp02_nym-binaries-1.0.2_static-http-download_no-client-cover-traffic_filtered-to-start-end-main"
# set DATABASE_ID = experiment 5 id
# set DATABASE_ID = experiment 6 id

foreach SET ("train" "val" "test")
    cat $DATABASES_PATH/$DATABASE_ID/flowpairs_${SET}.json | cut -d\" -f2 | grep _ > $DATABASES_PATH/$DATABASE_ID/flowpairs_${SET}.txt
end
