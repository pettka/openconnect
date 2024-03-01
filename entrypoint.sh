#!/bin/bash -x

if [[ ! -z "${REMOTE_SSH_ADDRESS}" ]]; then
     if [[ ! -z "${REMOTE_SSH_PORT}" ]]; then
        ncat -k -l -p 22 -c "ncat ${REMOTE_SSH_ADDRESS} ${REMOTE_SSH_PORT}" &
    else
        ncat -k -l -p 22 -c "ncat ${REMOTE_SSH_ADDRESS} 22" &
    fi
fi
if [[ ! -z "${REMOTE_RDP_ADDRESS}" ]]; then
    if [[ ! -z "${REMOTE_RDP_PORT}" ]]; then
        ncat -k -l -p 3389 -c "ncat ${REMOTE_RDP_ADDRESS} ${REMOTE_RDP_PORT}" &
    else
        ncat -k -l -p 3389 -c "ncat ${REMOTE_RDP_ADDRESS} 3389" &
    fi
fi

# Run OpenConnect Server
# exec "$@"

/usr/sbin/openconnect "$@"