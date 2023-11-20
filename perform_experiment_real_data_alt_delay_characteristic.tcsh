#!/usr/bin/tcsh

set MIXCORR_DATA_PATH = `cat MIXCORR_DATA_PATH.txt`
set LOGS_PATH = ${MIXCORR_DATA_PATH}/logs
set DATABASES_PATH = `cat DATABASES_PATH.txt`
set DATABASE_ID = dataset_exp08_nym-binaries-v1.1.13_static-http-download_filtered-to-start-end
# set DATABASE_ID = dataset_exp07_nym-binaries-1.0.2_static-http-download_network-delay_filtered-to-start-end
# set DATABASE_ID = "dataset_exp02_nym-binaries-1.0.2_static-http-download_no-client-cover-traffic_filtered-to-start-end-main"
# set DATABASE_ID = experiment 5 id
# set DATABASE_ID = experiment 6 id

set CHUNKS_COUNT = 23
set CURRENT_CHUNK = 1

while ($CURRENT_CHUNK <= $CHUNKS_COUNT)
    set NEXT_CHUNK = `echo "$CURRENT_CHUNK + 1" | bc`
    echo -n "Launching chunk $NEXT_CHUNK/$CHUNKS_COUNT ... "
    echo "perform_experiment_real_data_alt_delay_characteristic_chunk($CURRENT_CHUNK, $CHUNKS_COUNT, '$DATABASES_PATH', '$DATABASE_ID');" | octave >& $LOGS_PATH/${DATABASE_ID}_${CURRENT_CHUNK}_of_${CHUNKS_COUNT}.log &
    echo "Done."
    set CURRENT_CHUNK = $NEXT_CHUNK
end

echo "Check logs in $LOGS_PATH"
