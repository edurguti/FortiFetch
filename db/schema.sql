CREATE TABLE device (
  device_id INTEGER PRIMARY KEY AUTOINCREMENT,
  hostname TEXT,
  serial_number TEXT,
  version TEXT,
  model TEXT
);

CREATE TABLE interface (
  interface_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  vdom TEXT,
  mode TEXT,
  status TEXT,
  mtu INTEGER,
  ip TEXT,
  type TEXT,
  allowaccess TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id)
  UNIQUE (name, device_id)
);

CREATE TABLE firewallpolicy (
  fwpolicy_id INTEGER PRIMARY KEY AUTOINCREMENT,
  policy_id INTEGER,
  fwpolicy_name TEXT,
  fwpolicy_status TEXT,
  srcintf TEXT,
  dstintf TEXT,
  action TEXT,
  nat64 TEXT,
  nat46 TEXT,
  srcaddr6 TEXT,
  dstaddr6 TEXT,
  srcaddr TEXT,
  dstaddr TEXT,
  internet_service_name TEXT,
  internet_service_src_name TEXT,
  internet_service_dynamic TEXT,
  internet_service_custom_group TEXT,
  internet_service TEXT,
  internet_service_src TEXT,
  internet_service_group TEXT,
  internet_service_src_group TEXT,
  internet_service_src_dynamic TEXT,
  internet_service_src_custom_group TEXT,
  schedule TEXT,
  schedule_timeout TEXT,
  service TEXT,
  service_utm_status TEXT,
  inspection_mode TEXT,
  http_policy_redirect TEXT,
  ssh_policy_redirect TEXT,
  profile_type TEXT,
  profile_group TEXT,
  profile_protocol_options TEXT,
  ssl_ssh_profile TEXT,
  av_profile TEXT,
  webfilter_profile TEXT,
  dnsfilter_profile TEXT,
  emailfilter_profile TEXT,
  dlp_profile TEXT,
  file_filter TEXT,
  ips_sensor TEXT,
  application_list TEXT,
  voip_profile TEXT,
  sctp_profile TEXT,
  icap_profile TEXT,
  cifs_profile TEXT,
  waf_profile TEXT,
  ssh_filter_profile TEXT,
  logtraffic TEXT,
  logtraffic_start TEXT,
  capture_packet TEXT,
  traffic_shaper TEXT,
  traffic_shaper_reverse TEXT,
  per_ip_shaper TEXT,
  nat TEXT,
  permit_any_host TEXT,
  permit_stun_host TEXT,
  fixedport TEXT,
  ippool TEXT,
  poolname TEXT,
  poolname6 TEXT,
  inbound TEXT,
  outbound TEXT,
  natinbound TEXT,
  natoutbound TEXT,
  wccp TEXT,
  ntlm TEXT,
  ntlm_guest TEXT,
  ntlm_enabled_browsers TEXT,
  groups TEXT,
  users TEXT,
  fsso_groups TEXT,
  vpntunnel TEXT,
  natip TEXT,
  match_vip TEXT,
  match_vip_only TEXT,
  comments TEXT,
  label TEXT,
  global_label TEXT,
  auth_cert TEXT,
  vlan_filter TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id),
  UNIQUE (fwpolicy_name, device_id)
);


CREATE TABLE webprofile (
  webprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  comment TEXT,
  options TEXT,
  https_replacemsg TEXT,
  override TEXT,
  web TEXT,
  ftgd_wf TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id)
  UNIQUE (name, device_id)
);

CREATE TABLE dnsprofile (
  dnsprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  comment TEXT,
  domain_filter TEXT,
  ftgd_dns TEXT,
  block_botnet TEXT,
  safe_search TEXT,
  youtube_restrict TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id)
  UNIQUE (name, device_id)
);

CREATE TABLE appprofile (
  appprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  comment TEXT,
  entries TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id)
  UNIQUE (name, device_id)
);

CREATE TABLE ipsprofile (
  ipsprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  comment TEXT,
  block_malicious_url TEXT,
  scan_botnet_connections TEXT,
  extended_log TEXT,
  entries TEXT,
  device_id INTEGER,
  FOREIGN KEY (device_id) REFERENCES device(device_id)
  UNIQUE (name, device_id)
);

CREATE TABLE sslsshprofile (
allowlist TEXT,
block_blocklisted_certificates TEXT,
caname TEXT,
comment TEXT,
device_id INTEGER,
dot TEXT,
ftps TEXT,
https TEXT,
imaps TEXT,
mapi_over_https TEXT,
name TEXT,
pop3s TEXT,
rpc_over_https TEXT,
smtps TEXT,
ssl TEXT,
ssl_exempt TEXT,
ssl_exemption_ip_rating TEXT,
ssl_server TEXT,
ssh TEXT,
untrusted_caname TEXT,
sslsshprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
FOREIGN KEY (device_id) REFERENCES device(device_id)
UNIQUE (name, device_id)
);

CREATE TABLE avprofile (
avprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
comment TEXT,
http TEXT,
ftp TEXT,
imap TEXT,
pop3 TEXT,
smtp TEXT,
mapi TEXT,
nntp TEXT,
cifs TEXT,
ssh TEXT,
nac_quar TEXT,
content_disarm TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id),
UNIQUE (name, device_id)
);

CREATE TABLE address (
address_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
subnet TEXT,
address_type TEXT,
start_ip TEXT,
end_ip TEXT,
fqdn TEXT,
country TEXT,
associated_interface TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id),
UNIQUE (name, device_id)
);

CREATE TABLE addressgroup (
address_group_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
member TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id)
UNIQUE (name, device_id)
);

CREATE TABLE internetservice (
internet_service_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
type TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id)
UNIQUE (name, device_id)
);

CREATE TABLE ippool (
ippool_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
type TEXT,
start_ip TEXT,
end_ip TEXT,
startport TEXT,
endport TEXT,
source_start_ip TEXT,
source_end_ip TEXT,
arp_reply TEXT,
arp_intf TEXT,
associated_interface TEXT,
comments TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id)
UNIQUE (name, device_id)
);

CREATE TABLE vip (
vip_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
comment TEXT,
type TEXT,
ext_ip TEXT,
ext_addr TEXT,
nat44 TEXT,
mapped_ip TEXT,
mapped_addr TEXT,
ext_intf TEXT,
arp_reply TEXT,
portforward TEXT,
status TEXT,
protocol TEXT,
ext_port TEXT,
mapped_port TEXT,
src_filter TEXT,
portmapping_type TEXT,
realservers TEXT,
interface_id INTEGER,
device_id INTEGER,
FOREIGN KEY (interface_id) REFERENCES interface(interface_id),
FOREIGN KEY (device_id) REFERENCES device(device_id)
UNIQUE (name, device_id)
);

CREATE TABLE trafficshapers (
  trafficshaper_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  guaranteed_bandwidth INTEGER,
  maximum_bandwidth INTEGER,
  bandwidth_unit TEXT,
  priority INTEGER,
  per_policy TEXT,
  diffserv TEXT,
  diffservcode TEXT,
  dscp_marking_method TEXT,
  exceed_bandwidth INTEGER,
  exceed_dscp TEXT,
  maximum_dscp TEXT,
  overhead INTEGER,
  exceed_class_id INTEGER,
  device_id INTEGER,
  
  FOREIGN KEY (device_id) REFERENCES device(device_id),
  UNIQUE (name, device_id)
);


CREATE TABLE trafficpolicy (
    trafficpolicy_id INTEGER PRIMARY KEY AUTOINCREMENT,
    policy_id INTEGER,
    name TEXT,
    comment TEXT,
    status TEXT,
    ip_version TEXT,
    srcintf TEXT,
    dstintf TEXT,
    srcaddr TEXT,
    dstaddr TEXT,
    internet_service TEXT,
    internet_service_name TEXT,
    internet_service_group TEXT,
    internet_service_custom TEXT,
    internet_service_src TEXT,
    internet_service_src_name TEXT,
    internet_service_src_group TEXT,
    internet_service_src_custom TEXT,
    internet_service_src_custom_group TEXT,
    service TEXT,
    schedule TEXT,
    users TEXT,
    groups TEXT,
    application TEXT,
    app_group TEXT,
    url_category TEXT,
    traffic_shaper TEXT,
    traffic_shaper_reverse TEXT,
    per_ip_shaper TEXT,
    class_id INTEGER,
    diffserv_forward TEXT,
    diffserv_reverse TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id),
    UNIQUE (name, device_id)
);

CREATE TABLE dns (
    dns_id INTEGER PRIMARY KEY AUTOINCREMENT,
    primary_dns TEXT,
    secondary_dns TEXT,
    protocol TEXT,
    ssl_certificate TEXT,
    server_hostname TEXT,
    domain TEXT,
    ip6_primary TEXT,
    ip6_secondary TEXT,
    dns_timeout TEXT,
    retry TEXT,
    cache_limit TEXT,
    cache_ttl TEXT,
    source_ip TEXT,
    interface_select_method TEXT,
    interface TEXT,
    server_select_method TEXT,
    alt_primary TEXT,
    alt_secondary TEXT,
    log_fqdn TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE staticroute (
    static_route_id INTEGER PRIMARY KEY AUTOINCREMENT,
    seq_num INTEGER,
    status TEXT,
    dst TEXT,
    src TEXT,
    gateway TEXT,
    distance INTEGER,
    weight INTEGER,
    priority INTEGER,
    device TEXT,
    comment TEXT,
    blackhole TEXT,
    dynamic_gateway TEXT,
    sdwan_zone TEXT,
    dstaddr TEXT,
    internet_service TEXT,
    internet_service_custom TEXT,
    tag TEXT,
    vrf TEXT,
    bfd TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE policyroute (
    policy_route_id INTEGER PRIMARY KEY AUTOINCREMENT,
    seq_num INTEGER,
    input_device TEXT,
    input_device_negate TEXT,
    src TEXT,
    srcaddr TEXT,
    src_negate TEXT,
    dst TEXT,
    dstaddr TEXT,
    dst_negate TEXT,
    action TEXT,
    protocol TEXT,
    start_port INTEGER,
    end_port INTEGER,
    start_source_port INTEGER,
    end_source_port INTEGER,
    gateway TEXT,
    output_device TEXT,
    status TEXT,
    comments TEXT,
    internet_service_id INTEGER,
    internet_service_custom TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE snmpv2 (
    snmpv2_id INTEGER PRIMARY KEY AUTOINCREMENT,
    id INTEGER,
    name TEXT,
    status TEXT,
    host TEXT,
    host6 TEXT,
    query_v1_status TEXT,
    query_v1_port INTEGER,
    query_v2c_status TEXT,
    query_v2c_port INTEGER,
    query_trap_v1_status TEXT,
    query_trap_v1_rport INTEGER,
    query_trap_v2c_status TEXT,
    query_trap_v2c_lport INTEGER,
    query_trap_v2c_rport INTEGER,
    events TEXT,
    vdoms TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);