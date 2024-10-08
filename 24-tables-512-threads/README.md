i4i.4xlarge was used with debian-12 image, docker mysql and sysbench images.
The simple scripts in this project were used:

https://github.com/mcgrof/plot-sysbench

The above is now properly integrated into kdevops, as a new "sysbench" workflow,
you can select the "TPS variability test", that is enable
CONFIG_SYSBENCH_TEST_ATOMICS_TPS_VARIABILITY. Currently there is support with:

make defconfig-sysbench-mysql-atomic-tps-variability

Cloud support needs to just be run / extended for other cloud provideres.

the only thing modified was the kernel.

12 hour run for TPS variability tests.

On the configuration for MySQL:

innodb_redo_log_capacity        = 1G                                             
innodb_buffer_pool_size         = 512M                                           
                                                                                 
# Take advantage of NVMe AWUPF >= 4k                                             
innodb_flush_method             = O_DIRECT                                       
innodb_page_size                = 16384                                          
innodb_doublewrite              = 0

One xfs-16k test was done with

innodb_doublewrite              = 1

The rest the configuration was inspired by Google PerfKitBenchmarker 
perfkitbenchmarker/data/relational_db_configs/hammerdb_optimized_minimum_recovery_mysqld.cnf

They however had:

innodb_buffer_pool_instances    = 64                                             
innodb_buffer_pool_size         = {{INNODB_BUFFER_POOL_SIZE}}G                   
innodb_file_per_table           = 1                                              
innodb_flush_log_at_trx_commit  = 0                                              
innodb_flush_method             = O_DIRECT                                       
innodb_log_buffer_size          = 1G                                             
innodb_log_file_size            = 4G                                             
innodb_log_files_in_group       = 32 
