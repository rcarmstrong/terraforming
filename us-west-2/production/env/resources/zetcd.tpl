[Unit]
Requires=docker.service
After=docker.service
After=containerd.service docker.socket network-online.target
Wants=network-online.target
Requires=containerd.service docker.socket

[Service]
ExecStart=/bin/sh -c "docker run --net host -t quay.io/coreos/zetcd -endpoints localhost:2379"