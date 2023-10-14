#!/bin/bash

echo "" > test-client.txt
echo "" > test-prefix.txt

p=(\
    AODH \
    BARBICAN \
    BLAZAR \
    CEILOMETER \
    CINDER \
    CLOUDKITTY \
    CONGRESS \
    CYBORG \
    DESIGNATE \
    DRAC \
    FREEZER \
    GLANCE \
    GLARE \
    HEAT \
    HPLEFTHAND \
    IRONIC-INSPECTOR- \
    IRONIC \
    K8S \
    KARBOR \
    KEYSTONE \
    MAGNUM \
    MANILA \
    MISTRAL \
    MONASCA \
    MURANO \
    NEUTRON \
    NOVA \
    OCTAVIA \
    OPENSTACK \
    OS-CLIENT-CONFIG \
    PANKO \
    QINLING \
    SAHARA \
    SCCI \
    SEAMICRO \
    SEARCHLIGHT \
    SENLIN \
    SWIFT \
    TACKER \
    TROVE \
    VITRAGE \
    WATCHER \
    ZAQAR \
    ZUN \
)

for x in ${p[@]} ; do
    i=$(echo $x | tr '[:upper:]' '[:lower:]')
    pip install ${i}client && echo ${i}client >> test-client.txt
    if [ $? -ne 0 ] ; then
        pip install python-${i}client && echo python-${i}client >> test-prefix.txt
    fi
done