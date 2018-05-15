[Unit]
Requires=coreos-metadata.service
After=coreos-metadata.service

[Service]
EnvironmentFile=/run/metadata/coreos
ExecStart=
ExecStart=/usr/lib/coreos/etcd-wrapper $$ETCD_OPTS \
                                       --name="${name}" \
                                       --listen-peer-urls="http://0.0.0.0:2380" \
                                       --listen-client-urls="http://$${COREOS_EC2_IPV4_LOCAL}:2379,http://0.0.0.0:4001" \
                                       --initial-advertise-peer-urls="http://$${COREOS_EC2_IPV4_LOCAL}:2380" \
                                       --advertise-client-urls="http://$${COREOS_EC2_IPV4_LOCAL}:2379" \
                                       --initial-cluster-state=${cluster_state} \
                                       --initial-cluster="${cluster_list}"
