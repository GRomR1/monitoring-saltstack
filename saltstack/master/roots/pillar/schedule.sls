schedule:
  apply-state-highstate:
    enabled: true
    run_on_start: true
    function: state.highstate
    seconds: 180
    splay: 30

  sync-all-master:
    function: saltutil.sync_all
    seconds: 10
    maxrunning: 1

  get-big-payload:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 10
    args:
      - 2 # number of rows (items inf array)
      - 10 # number of charecters in rows

  get-common-grains:
    enabled: true
    function: grains.item
    seconds: 120
    splay: 10
    args:
      - fqdn
      - fqdn_ip4
      - cpu_model
      - disks
      - domain
      - hwaddr_interfaces
      - id
      - kernel
      - master
      - mem_total
      - nodename
      - num_cpus
      - oscodename
      - osfullname
      - osrelease
