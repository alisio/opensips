v0.6.4 - 2019-09-19 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>
- Offer mediaproxy when connecting to mediaserver on the same server

v0.6.3 - 2019-09-19 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Set VM hostname in the vagrant file
- Fix resource ordering issue
- Install epel-release only if repo_install is true
- Set rpid header in the gateway route
- Fix repo_install=false install rtpengine test manifest repo
- Add parameter to define if opensips.cfg and opensipsctlrc shoul be replaced by puppet.
- Change default mediaproxy to rtpengine in tests/init.pp manifest

v0.6.2 - 2019-09-17 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add avpops modules
- Add first_name,dpid and privacy columns to the subscriber table in opensips database
- Add Remote-Party-ID header according to the rpid information

v0.6.1 - 2019-09-10 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- bump version

v0.6.0 - 2019-09-10 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add Webrtc support with samples opensips script from opensips.org
- Fix opensips_cp_rtpengine* and opensips_cp_rtpproxy test manifests
- Change default behaviour for repositorie installation to true

v0.5.0 - 2019-09-02 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Fix ineffective ratelimit function
- Change default rate limit to 10
- Add bolt tasks ctl, domainadd, domainrm, domainshow, restart, ulshow

v0.4.4 - 2019-09-02 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Fix typo

v0.4.3 - 2019-07-31 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add mediaproxy offer flags parameters
- Add apache NOTICE

v0.4.2 - 2019-07-31 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Fix mediaproxy_type bugs

v0.4.1 - 2019-07-31 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Consolidate mediaproxy parameters


v0.4.0 - 2019-07-31 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add support for rtpengine media proxy
- Refactor code to remove dependency on 'herculesteam-augeasproviders_syslog', 'puppet-logrotate' and 'puppet-selinux'
- Refactor code do minimiza duplicated declaration problems
- Add sample install procedure to Readme

v0.3.4 - 2019-07-25 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add call rate limit using ratelimit module and update
- Update documentation (readme, class comments, changelog)

v0.3.3 - 2019-07-22 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add Opensisp HTTP Manager interface config parameter $opensips_http_mi_port
- Fix Readme parameters formatting
- Add class comments for automatic documentation

v0.3.2 - 2019-07-22 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Fix opensips.cfg predefined routes.
- Add basic opensips operation commands to the readme file
- Change opensips_gwpadrao_hostport variable name to opensips_defaultgw_hostport

v0.3.1 - 2019-07-22 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- fix project, source and url issues pages


v0.3.0 - 2019-07-22 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Fix systemd unit order
- Add explicit namespaces to variables

v0.2.0 - 2019-07-18 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

- Add class variables
- Change dependencies


v0.1.0 - 2019-07-18 Antonio Alisio de Meneses Cordeiro <alisio.meneses@gmail.com>

First version
