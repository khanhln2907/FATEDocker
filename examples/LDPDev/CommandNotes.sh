# Update database to pipeline
# python ${your_install_path}/python/fate_flow/fate_flow_client.py -f upload -c upload_data.json

# Init flow
# Link web: https://fate.readthedocs.io/en/latest/_build_temp/python/fate_client/flow_client/README.html
#flow init -c /data/projects/fate/python/conf/service_conf.yaml
flow init --ip 127.0.0.1 --port 9380

# Upload for training version
flow data upload -c ./examples/LDPDev/upload_data_host.json
flow data upload -c ./examples/LDPDev/upload_data_guest.json

# submit model training process
# Link web : https://github.com/FederatedAI/FATE/tree/master/examples/dsl/v2/hetero_secureboost
flow job submit -c ./examples/LDPDev/dsl/v2/hetero_secureboost/test_secureboost_train_binary_conf.json -d ./examples/LDPDev/dsl/v2/hetero_secureboost/test_secureboost_train_dsl.json

# Deploy the trained model
flow model deploy --model-id guest-9999#host-9998#model --model-version 202106152101093465361 #--cpn-list "dataio_0, intersection_0, hetero_secure_boost_0"
# Query 
flow model get-model-info --model-id guest-9999#host-9998#model --model-version 202106152101093465361 --detail
flow job config -j 202106152101093465361 -r guest -p 9999 -o ./

# Update data table for prediction
flow data upload -c ./examples/LDPDev/upload_data_host_predict.json --verbose --drop
flow data upload -c ./examples/LDPDev/upload_data_guest_predict.json --verbose --drop

# Submit prediction process
flow job submit -c ./examples/LDPDev/test_predict_conf.json 