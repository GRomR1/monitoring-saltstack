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

  get-low-payload-2-10:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 10
    args:
      - 2 # number of rows (items inf array)
      - 10 # number of charecters in rows

  get-low-payload-10-100:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 20
    args:
      - 10 # number of rows (items inf array)
      - 100 # number of charecters in rows

  get-mid-payload-50-1k:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 30
    args:
      - 50 # number of rows (items inf array)
      - 1000 # number of charecters in rows

  get-mid-payload-200-1k:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 40
    args:
      - 200 # number of rows (items inf array)
      - 1000 # number of charecters in rows

  get-big-payload-1k-1k:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 50
    args:
      - 1000 # number of rows (items inf array)
      - 1000 # number of charecters in rows

  get-big-payload-1k-10k:
    enabled: true
    run_on_start: true
    function: big_payload.call
    seconds: 60
    args:
      - 1000 # number of rows (items inf array)
      - 10000 # number of charecters in rows

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
