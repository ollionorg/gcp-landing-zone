
# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.0.2] - 2022-05-05
 
Release 0.0.2 for the GCF Landing Zone. Below are the details for the release.

### Added


* Terraform Validator.
* Adding projects to the monitoring project on per environment basis.
* Templated the repository to be used for creating new repository for deployments.


- [GCIFI-352](https://cldcvr.atlassian.net/browse/GCIFI-352): Implement use of policy-library with terraform-validator
- [GCIFI-309](https://cldcvr.atlassian.net/browse/GCIFI-309): Terraform code for addition of projects in the monitoring project

### Changed

* Wrapper script with m4 macro preprocessor for the initial 0-bootstrap deployment.
* Enhancements in the network script to generate network subnets for 0-bootstrap, based on the CIDR provided.


- [GCIFI-321](https://cldcvr.atlassian.net/browse/GCIFI-321): Use m4 macro preprocessor in the wrapper script to substitute variables from the main branch

 
### Fixed







 
## [0.0.1] - 2022-03-31
 
The initial release for the GCF Landing Zone. Below are the details for the release.

### Added

* Wrapper script for initial deployment of 0-bootstrap stage.
* Code to create and register GitHub Runners.
* Code to configure GitHub repository with branch protection rules.
* Script to generate network subnets for 0-bootstrap, based on the CIDR provided


- [GCIFI-258](https://cldcvr.atlassian.net/browse/GCIFI-258): Modify Terraform Code to include resources in CICD Project
- [GCIFI-261](https://cldcvr.atlassian.net/browse/GCIFI-261): Create script to set CIDRs for 3-networks
- [GCIFI-311](https://cldcvr.atlassian.net/browse/GCIFI-311): Create wrapper script for the initial deployment of 0-bootstrap
- [GCIFI-324](https://cldcvr.atlassian.net/browse/GCIFI-324): Create Branch Protection rules for `${bu_name-main` branch

### Changed

* Refactored code for GCF Landing Zone.
* Environment name from Non-production to Staging.


- [GCIFI-246](https://cldcvr.atlassian.net/browse/GCIFI-246): Variablise and refactor the code
- [GCIFI-253](https://cldcvr.atlassian.net/browse/GCIFI-253): Change environment name from `non-production` to `staging`
 
### Fixed

* Removed unwanted resources from CICD project.


- [GCIFI-257](https://cldcvr.atlassian.net/browse/GCIFI-257): Cleanup code to remove unwanted resources from CICD Project


