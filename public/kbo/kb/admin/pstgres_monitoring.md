# postgres monitoring

 * https://docs.google.com/document/d/1VDMOQemf2XLWSD660GCMXSNC8tMY6Jg5K-nlxM2e2Ps/edit

System
   * Basic
   * CPU
   * LA
   * Memory usage
   * Memory errors
   * Swap usage
   * Swap I/O
   * Disk
   * Read and write latency
   * IOPS (read and write)
   * Throughput (read and write)
   * % util / io usage
   * Disk space
   * Page cache hit/miss
   * Network
   * Bandwidth
   * Errors, dropped packets
   * Packets/second
   * Connections (in / out; per status / per IP)
   * Process analysis
   * Top-N by CPU load
   * Top-N by RAM load
   * Top-N by disk reads (IOPS and throughput)
   * Top-N by disk writes (IOPS and throughput)
   * Top-N by swap (amount + rates)
   * Top-N by process count and by threads count
   * Top-N by open files
Postgres
   * Main
   * Average query time
   * Connections (by state in pg_stat_activity)
   * Top-N transactions by age
   * Total query time (by query group from pg_stat_statements)
   * Buffers hits and reads (by query group from pg_stat_statements[a][b])
   * Buffers written, dirtied (by query group from pg_stat_statements)
   * Transactions (committed vs rolled back)
   * Replication lags
   * Autovacuum
   * Workers (by mode: main vs tx ID wraparound)
   * Top-N tables (and DBs) by autovacuum pending work
   * TXs left (tx ID wraparound), database transaction age
   * Autovacuum queue and progress https://gitlab.com/snippets/1889668
   * Bloat (estimated)
   * Table bloat (estimated)
   * Index bloat (estimated)
   * Checkpoints, bgwriter
   * Disk writes (by processes)
   * Pages dirtied by queries
   * Checkpoints issued
   * Connections
   * # of connections by state + max_connections
   * Connections by client address (active + all)
   * Connections by app (active + all)
   * Connections by DB user
   * Connections by database name
   * Idle in transaction connections
   * Locks, waits
   * Total number of locks acquired
   * Locks by time
   * Queries blocked longer than X seconds
   * Deadlocks
   * Types of waits
   * Replication
   * Destination (follower)
   * Replication lag in bytes (for followers of the current node)
   * Replication lag in bytes (for the current node compared to the leader)
   * Replication lag in seconds (for the current node compared to the leader)
   * Origin (primary or replica with cascaded replication)
   * Unused replication slots / replication statuses
   * Amount of bytes for each replication slot
   * Replication lag phases (1 graph for each follower)
   * Tables
   * Table sizes (total, heap, TOAST, indexes)
   * Estimated rows
   * Top-N by seqscan
   * Top-N by blocks read
   * Top-N by INSERT
   * Top-N by UPDATE
   * Top-N by DELETE
   * Top-N by size (tuples, bytes)
   * Top-N by bloat (estimated!)
   * Top-N by n_dead_tup
   * Indexes
   * Index sizes
   * Index usage
   * Not valid indexes
   * Unused indexes
   * Redundant indexes
   * Functions
   * Function usage (calls per second)
   * Average time of execution (total, self)
   * WAL
   * pg_xlog/pg_wal size
   * Archiver statuses (fail/success)
   * WAL write rates, B/s
   * WAL files count (total, unarchived)
   * WAL directory size
   * WAL files which ready to be archived (count of files in pg_xlog/pg_wal/archive_status which end in ".ready")
   * Transactions
   * Transactions per second (TPS)
   * Long-running transactions  / max transaction age
   * Query macro-analysis based on pg_stat_statements
   * Top-N by total_time
   * Top-N by mean_time
   * Top-N by calls
   * Top-N by CPU usage
   * Top-N by I/O timing[c]
   * Top-N by I/O timing[d] - writes
   * Top-N by block reads (page cache->buffer pool)
   * Top-N by blocks dirtied
   * Top-N by rows
   * Top-N by block hits (buffer pool)
   * Top-N by temporary files generated (bytes; blocks)
   * Top-N by block reads from disk
   * Top-N by block writes
   * --- ability to filter and/or aggregate by dbid     (“no filter” also wanted)
   * --- ability to filter and/or aggregate by userid    (“no filter” also wanted)
   * --- ability to filter and/or aggregate by “the first word” (SELECT/INSERT/…)     (“no filter” also wanted)
   * --- ability to filter and/or aggregate by relations mentioned in query text     (“no filter” also wanted)


   * For each query group from the top-N list -- personal graphs showing:
   * mean_time
   * total_time (?)
   * calls
   * block operations
   * rows
   * query stages: CPU, I/O read, I/O write
   * more info: pg_stat_kcache, pg_qualstats, pg_sortstats
   * Macro-analysis based on wait events
   * Query groups by wait event types
   * Query groups by wait events
   * Top-N by time spent in wait event (agg. by type)
   * Top-N by time spent in wait event
   * For each query
   * History of the query group: wait event types
   * History of the query group: wait events
   * For each wait event type:
   * History of query groups
   * For each wait event:
   * History of query groups
   * Time spent in each event withing this type
   * Log analysis
   * Critical events: restarts, crashes
   * Autovacuum activity
   * Checkpointer activity
   * Locks (>deadlock_timeout)
   * Deadlocks
   * Query examples
   * Plan examples
   * Connections, disconnections
   * pgBouncer monitoring
   * From pgbouncer log:
   * Average query time
   * Average transaction time
   * Queries per second (QPS)
   * Transactions per second (TPS)
   * Traffic in and out, B/s
   * Number of connections by client addr
   * Connections between pgBouncer and Postgres, by state
   * Utilization for each pool
   * Waiting clients and waiting time
   * Backups
   * ?
   * Time from last successful time (graph)
   * Last backup size (graph)


Alerts


WIP


Critical
   * Disk space (% or in GiB)
   * Number of connections is close to max_connections (%)
   * Number of idle-in-transaction connections > N
   * Inactive replication slots
   * Replication slot size is > X
   * Autovacuum workers = autovacuum_max_workers
   * Transaction ID wraparound risk
   * Archives failed X times in Y seconds
   * Long blocking session (e.g. >1min)
   * Time from last successful backup (e.g. >30hours)
[a]Isn't better use pg_stat_kcache?
[b]Here "reads" mean "reads from the page cache". It's based on pg_stat_statements.


pg_stat_kcache is not a part of this list because it's quite rare to see in the wild, it's a 3rd part extension (although, useful)
[c]Two options here:
1) timing of shared block "reads" (reading from the page cache),
2) real disk reads (pg_stat_kcache)
[d]Two options here:
1) timing of shared block "reads" (reading from the page cache),
2) real disk reads (pg_stat_kcache)

## SRE runbook

 * [Follow-up doc: PostgreSQL Troubleshooting & Monitoring – Checklist / Runbook](https://docs.google.com/document/d/1Kj7qfrNN7rxFZOGBlA40Yp_gW_KT7-wYHnuf4oP6D34/edit)


PostgreSQL Troubleshooting Checklist / Runbook

System level
Use a common method known to SREs. Such as:
* USE https://www.brendangregg.com/usemethod.html
* RED https://grafana.com/blog/2018/08/02/the-red-method-how-to-instrument-your-services/
* Four golden signals  https://sre.google/sre-book/monitoring-distributed-systems/


Further, we discuss only database-specific metrics.
Database level
Basics - “PostgreSQL Dashboard #1”


This is what the main dashboard should always have. These metrics are very basic and should be available very fast – it’s like utilization of CPU or disk IO in the “System level”.


The very basic metrics – for each node in node group and/or summarized + separately for the primary:
1. TPS and (optional but also desired) QPS
2. Latency (query duration) – at least average. Better: histogram, percentiles
3. Connections (sessions) – stacked graph of session counts by state (first of all: active and idle-in-transaction; also interesting: idle, others) and how far the sum is from max_connection (+pool size for pgBouncer).
4. Longest transactions (max transaction age or top-n transactions by age), excluding autovacuum activity
5. Commits vs rollbacks – how many transactions are rolled back
6. Transactions left till transaction ID wraparound
7. Replication lags / bytes in replication slot / unused replication slots
8. Count of WALs waiting to be archived (archiving lag)
9. WAL generation rates
10. Locks and deadlocks
11. Basic query analysis graph (top-n by total_time or by mean_time?)
12. Basic wait event analysis (a.k.a. “active session analysis” or “performance insights”)




What’s next
* Query analysis:
   * pgss (pg_stat_statements): dashboard/table with top-N (by total_time, mean_time, calls, IO)
   * pgss: plus sets of graphs for each query group from top-N lists
   * wait event sampling (a.k.a. “active session analysis” or “performance insights”)
* Error analysis (counts by error code – based on logerrors or PG log analysis)
* Saturation analysis and capacity planning
   * Transaction ID wraparound
   * int4 PKs
   * CPU (system)
   * Disk: space, inodes, IO throughput and IOPS – read and write  (system)
   * Network IO (system)
   * Connections (postgres, pgBouncer)
   * Autovacuum workers, autovacuum queue
   * Bloat (table and btree)
   * pgBouncer – single CPU load
   * walsender – single CPU load
* pgBouncer dashboard
* Checkpointer, bgwriter and IO dashboard
* Autovacuum dashboard
* Tables and indexes – sizes, ops, and tuple stats
* Dead tuples and bloat
* Locks
* Connections
* Replication
* Backups






Runbook #1 (draft)
During troubleshooting and database performance analysis , perform shallow but wide top-level checks first, to quickly find symptoms and identify directions of further investigation:
1. Determine what host is currently the primary for the cluster. Ways to do it:
   1. [monitoring link here]
   2. patronictl list
   3. (less preferred – manual check of each node) SQL: select pg_is_in_recovery();
2. Analyze the system-level metrics, applying the existing methodology to all PostgreSQL hosts in the cluster, distinguishing primary and all secondaries. For each resources, compare with expected utilization. [monitoring links here – Host Stats, etc]
3. Now, PostgreSQL-specific metrics:
   1. TPS and QPS – is utilization at the expected level? Do we have ongoing or recent spikes? [link to monitoring here]. If issue is found here, next steps: identify the source of higher rates of TPS/QPS, see what query groups have increased rates (using detailed query analysis).
   2. Latencies (query duration, average of percentiles/histogram): is it at the expected level? Do we have ongoing or recent spikes? [link to monitoring here]
   3. Connections:
      1. First, check the overall connection count: is it at the expected level? Do we have ongoing or recent spikes? [link to monitoring here]
      2. Next, pay special attention to “active” and “idle-in-transaction” connections, separately. Same questions: is utilization as expected? Do we have spikes? [link to monitoring here]
      3. Finally, check “idle” connection counts – high numbers of them can cause performance degradation too.
   4. Do we have long-running transactions (besides autovacuum activities)? For all production PostgreSQL nodes serving traffic originated from user requests: any transactions lasting longer than 5 minutes should be canceled immediately, unless they are absolutely needed and coordinated via some production issue, running under control of a database engineer. [link to monitoring here]
   5. Commit vs. rollback ratio – is it unusual? If this is so, then we need to check what kind of errors we have  [link to monitoring here]
   6. State of replication – lags of replication, state of replication slots (unused slots, lagging slots) [link to monitoring here]
   7. Count of WALs waiting to be archived – normally should not exceed 10.  [link to monitoring here] If it exceeds, this is a major issue affecting backups (DR) and potentially a less critical issue with replicas consuming WALs from archives.
   8. WAL generation rates [link to monitoring here] – increased rates in WAL generation is an indicator of higher write activity that may affect: replication lags, backups and RPO/RTO,
   9. Locks  [link to monitoring here] Do we have spikes in excluding locks counts? If so, this cause slowdown for processing of some queries/transactions, and spikes of number of “active” sessions. List of lock types can be found here: https://www.postgresql.org/docs/current/explicit-locking.html.
   10. Basic query analysis graph (top-n by total_time or by mean_time?) -- TBD
   11. Basic wait event analysis (a.k.a. “active session analysis” or “performance insights”) -- TBD