
# OpenStack Client (from pipx) (openstack-client)

Install an up-to-date version of OpenStack client with pipx.

## Example Usage

```json
"features": {
    "ghcr.io/framctr/devcontainer-features/openstack-client:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select or enter an OpenStack client version. | string | latest |
| aodh | Select or enter an OpenStack Alarming as a Service client version. To avoid installation use "none". | string | none |
| barbican | Select or enter an OpenStack Barbican Key Management API client version. To avoid installation use "none". | string | none |
| blazar | Select or enter an OpenStack Blazar Reservation Service client version. To avoid installation use "none". | string | none |
| ceilometer | Select or enter an OpenStack Ceilometer API client version. To avoid installation use "none". | string | none |
| cinder | Select or enter an OpenStack Cinder Volume API client version. To avoid installation use "none". | string | none |
| cloudkitty | Select or enter an OpenStack Cloudkitty Rating as a Service API client version. To avoid installation use "none". | string | none |
| congress | Select or enter an OpenStack Congress (open policy framework for the cloud) client version. To avoid installation use "none". | string | none |
| cyborg | Select or enter an OpenStack Cyborg API client version. To avoid installation use "none". | string | none |
| designate | Select or enter an OpenStack Designate API client version. To avoid installation use "none". | string | none |
| freezer | Select or enter an OpenStack Freezer (backup restore and disaster recovery service) client version. To avoid installation use "none". | string | none |
| glance | Select or enter an OpenStack Glance client version. To avoid installation use "none". | string | none |
| glare | Select or enter an OpenStack GLare Artifact REpository API client version. To avoid installation use "none". | string | none |
| heat | Select or enter an OpenStack Heat client version. To avoid installation use "none". | string | none |
| hplefthand | Select or enter an OpenStack HP LeftHand/StoreVirtual HTTP REST client version. To avoid installation use "none". | string | none |
| ironic | Select or enter an OpenStack Ironic (bare metal Service) client version. To avoid installation use "none". | string | none |
| karbor | Select or enter an OpenStack Karbor API client version. To avoid installation use "none". | string | none |
| keystone | Select or enter an OpenStack Keystone API client version. To avoid installation use "none". | string | none |
| magnum | Select or enter an OpenStack Magnum API client version. To avoid installation use "none". | string | none |
| manila | Select or enter an OpenStack Manila (shared file system as a service) client version. To avoid installation use "none". | string | none |
| mistral | Select or enter an OpenStack Mistral (Workflow as a Service) client version. To avoid installation use "none". | string | none |
| monasca | Select or enter an OpenStack Monasca API client version. To avoid installation use "none". | string | none |
| murano | Select or enter an OpenStack Murano API client version. To avoid installation use "none". | string | none |
| neutron | Select or enter an OpenStack Neutron API client version. To avoid installation use "none". | string | none |
| nova | Select or enter an OpenStack Nova API client version. To avoid installation use "none". | string | none |
| octavia | Select or enter an OpenStack Octavia Load Balancing client version. To avoid installation use "none". | string | none |
| panko | Select or enter an OpenStack Panko version. To avoid installation use "none". | string | none |
| qinling | Select or enter an OpenStack Qinling (Function as a Service) version. To avoid installation use "none". | string | none |
| sahara | Select or enter an OpenStack Sahara client version. To avoid installation use "none". | string | none |
| searchlight | Select or enter an OpenStack Searchlight (Indexing and Search API) client version. To avoid installation use "none". | string | none |
| senlin | Select or enter an OpenStack Senlin Clustering API client version. To avoid installation use "none". | string | none |
| swift | Select or enter an OpenStack Swift client version. To avoid installation use "none". | string | none |
| tacker | Select or enter an OpenStack Tacker client version. To avoid installation use "none". | string | none |
| trove | Select or enter an OpenStack Trove client version. To avoid installation use "none". | string | none |
| vitrage | Select or enter an OpenStack Vitrage (root cause analysis as a Service) client version. To avoid installation use "none". | string | none |
| watcher | Select or enter an OpenStack Watcher (Cloud Optimization as a Service) client version. To avoid installation use "none". | string | none |
| zaqar | Select or enter an OpenStack Zaqar Queueing API client version. To avoid installation use "none". | string | none |
| zun | Select or enter an OpenStack Zun container management service API client version. To avoid installation use "none". | string | none |



## Cloud name
Please remember to export the `OS_CLOUD` shell variable with the name of the target cloud, otherwise this tool cannot work.

## OS Support

This Feature should work on recent versions of Ubuntu-based distributions.

## Packages deprecation

Some packages are automatically installed with the openstack main client and are deprecated. For this reason some packages will be installed even if they are set to `none`.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/framctr/devcontainer-features/blob/main/src/openstack-client/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
