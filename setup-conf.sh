#!/usr/bin/env bash

source /env-data.sh

# This script will setup necessary configuration to enable replications

# Refresh configuration in case environment settings changed.
cat $CONF.template > $CONF

cat >> $CONF <<EOF
wal_level = hot_standby
max_wal_senders = $PG_MAX_WAL_SENDERS
wal_keep_segments = $PG_WAL_KEEP_SEGMENTS
hot_standby = on

# WARNING
# this tool not being optimal 
# for very high memory systems
# DB Version: 10
# OS Type: linux
# DB Type: dw
# Total Memory (RAM): 110 GB
# Number of Connections: 1000

max_connections = 1000
shared_buffers = 28160MB
effective_cache_size = 84480MB
maintenance_work_mem = 2GB
min_wal_size = 4GB
max_wal_size = 8GB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 500
random_page_cost = 1.1
effective_io_concurrency = 200
max_worker_processes = 22
max_parallel_workers_per_gather = 11
max_parallel_workers = 22
work_mem = 1310kB


EOF
