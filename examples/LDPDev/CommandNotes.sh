# Update database to pipeline
python ${your_install_path}/python/fate_flow/fate_flow_client.py -f upload -c upload_data.json

# Init flow
# Link web: https://fate.readthedocs.io/en/latest/_build_temp/python/fate_client/flow_client/README.html
#flow init -c /data/projects/fate/python/conf/service_conf.yaml
flow init --ip 127.0.0.1 --port 9380


# Upload with new version
flow data upload -c ./examples/LDPDev/upload_data_host.json
flow data upload -c ./examples/LDPDev/upload_data_guest.json

# submit model training process
# Link web : https://github.com/FederatedAI/FATE/tree/master/examples/dsl/v2/hetero_secureboost
flow job submit -c ./examples/LDPDev/dsl/v2/hetero_secureboost/test_secureboost_train_binary_conf.json -d ./examples/LDPDev/dsl/v2/hetero_secureboost/test_secureboost_train_dsl.json

# Submit prediction process
flow job submit -c ./examples/dsl/v1/hetero_secureboost/test_predict_conf.json 