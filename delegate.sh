#!/bin/bash

CHAINID="<chain-id>" #for example: morpheus-apollo-1
ADDRESS="<desmos1...>"
VALIDATOR="<desmosval...>"
MONIKER="<your_moniker_key_name>"
PATH="<your_directory/bin>"  #for example: /home/testnet/go/bin/desmosd 
GAS_VALUE="<gas_value>" #for example: 500000
FEE_VALUE="<fee_value>" #for example: 500udaric

# Withdraw 
${PATH} tx distribution withdraw-rewards "${VALIDATOR}" --from "${MONIKER}" --commission --chain-id=${CHAINID} --gas="${GAS_VALUE}" --fees="${FEE_VALUE}" -y


AVAILABLE_COIN=$(${PATH}desmos query bank balances ${ADDRESS} --output json | jq -r '.balances | map(select(.denom == "udaric")) | .[].amount + "udaric"')

sleep 30s

# Delegate
${PATH} tx staking delegate "${VALIDATOR}" "${AVAILABLE_COIN}" --from "${MONIKER}" --chain-id=${CHAINID} --gas="${GAS_VALUE}" --fees="${FEE_VALUE}" -y
