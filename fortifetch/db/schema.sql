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

CREATE TABLE snmpv3 (
    snmpv3_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    status TEXT,
    trap_status TEXT,
    trap_lport INTEGER,
    trap_rport INTEGER,
    queries TEXT,
    query_port INTEGER,
    notify_hosts TEXT,
    notify_hosts6 TEXT,
    source_ip TEXT,
    source_ipv6 TEXT,
    events TEXT,
    vdoms TEXT,
    security_level TEXT,
    auth_proto TEXT,
    priv_proto TEXT,
    priv_pwd TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE fortiguard (
    fortiguard_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fortiguard_anycast TEXT,
    fortiguard_anycast_source TEXT,
    protocol TEXT,
    port INTEGER,
    service_account_id TEXT,
    load_balace_servers TEXT,
    auto_join_forticloud TEXT,
    update_server_location TEXT,
    sandbox_region TEXT,
    sandbox_inline_scan TEXT,
    update_ffdb TEXT,
    update_uwdb TEXT,
    update_extdb TEXT,
    update_build_proxy TEXT,
    persistent_connection TEXT,
    vdom TEXT,
    auto_firmware_upgrade TEXT,
    auto_firmware_upgrade_day TEXT,
    auto_firmware_upgrade_start_hour INTEGER,
    auto_firmware_upgrade_end_hour INTEGER,
    antispam_force_off TEXT,
    antispam_cache TEXT,
    antispam_cache_ttl INTEGER,
    antispam_cache_mpercent INTEGER,
    antispam_license INTEGER,
    antispam_expiration INTEGER,
    antispam_timeout INTEGER,
    outbreak_prevention_force_off TEXT,
    outbreak_prevention_cache TEXT,
    outbreak_prevention_cache_ttl INTEGER,
    outbreak_prevention_cache_mpercent INTEGER,
    outbreak_prevention_license INTEGER,
    outbreak_prevention_expiration INTEGER,
    outbreak_prevention_timeout INTEGER,
    webfilter_force_off TEXT,
    webfilter_cache TEXT,
    webfilter_cache_ttl INTEGER,
    webfilter_license INTEGER,
    webfilter_expiration INTEGER,
    webfilter_timeout INTEGER,
    sdns_server_ip TEXT,
    sdns_server_port INTEGER,
    anycast_sdns_server_ip TEXT,
    anycast_sdns_server_port INTEGER,
    sdns_options TEXT,
    source_ip TEXT,
    source_ip6 TEXT,
    proxy_server_ip TEXT,
    proxy_server_port INTEGER,
    proxy_username TEXT,
    proxy_password TEXT,
    ddns_server_ip TEXT,
    ddns_server_ip6 TEXT,
    ddns_server_port INTEGER,
    interface_select_method TEXT,
    interface TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);


CREATE TABLE admin (
admin_id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
wildcard TEXT,
remote_auth TEXT,
remote_group TEXT,
trusthost1 TEXT,
trusthost2 TEXT,
trusthost3 TEXT,
trusthost4 TEXT,
trusthost5 TEXT,
trusthost6 TEXT,
trusthost7 TEXT,
trusthost8 TEXT,
trusthost9 TEXT,
trusthost10 TEXT,
ip6_trusthost1 TEXT,
ip6_trusthost2 TEXT,
ip6_trusthost3 TEXT,
ip6_trusthost4 TEXT,
ip6_trusthost5 TEXT,
ip6_trusthost6 TEXT,
ip6_trusthost7 TEXT,
ip6_trusthost8 TEXT,
ip6_trusthost9 TEXT,
ip6_trusthost10 TEXT,
accprofile TEXT,
allow_remove_admin_session TEXT,
comments TEXT,
vdoms TEXT,
force_password_change TEXT,
two_factor TEXT,
two_factor_authentication TEXT,
two_factor_notification TEXT,
device_id INTEGER,
FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE adminprofile (
    adminprofile_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    scope TEXT,
    comments TEXT,
    ftviewgrp TEXT,
    authgrp TEXT,
    sysgrp TEXT,
    netgrp TEXT,
    loggrp TEXT,
    fwgrp TEXT,
    vpngrp TEXT,
    utmgrp TEXT,
    wanoptgrp TEXT,
    wifi TEXT,
    netgrp_permission TEXT,
    sysgrp_permission TEXT,
    fwgrp_permission TEXT,
    loggrp_permission TEXT,
    utmgrp_permission TEXT,
    admintimeout_override TEXT,
    admintimeout INTEGER,
    systemdiagnostics TEXT,
    system_execute_ssh TEXT,
    system_execute_telnet TEXT,
    device_id INTEGER,
    FOREIGN KEY (device_id) REFERENCES device(device_id)
);

CREATE TABLE vpnmonitor (
    vpnmonitor_id INTEGER PRIMARY KEY,
    device_id INTEGER NOT NULL,
    phase1_name TEXT NOT NULL,
    phase2_name TEXT NOT NULL,
    phase2_status TEXT NOT NULL,
    FOREIGN KEY (device_id) REFERENCES device(id)
);