const Web3Utils = require("web3-utils");

export const ether = (n) => {
  return new Web3Utils.toBN(Web3Utils.toWei(n.toString(), "ether"));
};

// Same as ether
export const tokens = (n) => ether(n);

export const EVM_REVERT =
  "Returned error: VM Exception while processing transaction: revert";

export const EVM_INVALID_ADDRESS =
  'invalid address (arg="_to", coderType="address", value=0)';

export const ETHER_ADDRESS = "0x0000000000000000000000000000000000000000";
