## fanatics_pipeline

This cookbook is in development for a cookbook pipeline using Jenkins 2 on CentOS.

### TO-DO List for pipeline  :thumbsup:

- [x] Disable IPv6 ports
- [x] Install Jenkins 2
- [x] Download and install necessary Jenkins plugins (latest .hpi files)
- [x] Create .berksfile, config.json, .gitconfig, .chef files/directories
- [ ] Create knife.rb file for pipeline_job
- [x] Jenkins serverspec
	- [x] plugins
	- [x] directories
	- [x] service
- [x] Pipeline serverspec
	- [x] .berksfile
	- [x] config.json
	- [x] .gitconfig
	- [x] .chef
	- [ ] .chef/knife.rb
- [ ]  :trollface:  Download Jenkins CLI upon first converge  :trollface:
- [x] Create directory for git repos
- [ ] Grab deploy_flix and rr_install cookbook from Git and push it to a chef server
- [ ] Update test files
