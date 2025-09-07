export INFLUX_ORG="Malaga Corp."
export INFLUX_TOKEN=KecKb03puLg1m_vQ__DHsa0LZ2ot3JcJxvTxXZykYNQdaLp0rBPrj4snStW0yX5kJYvdPKlh-QoLSzI_e1m6qQ==

influx backup influx.bkp

scp -r influx.bkp debian@51.75.251.123:/tmp/
