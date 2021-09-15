const Web3Utils = require("web3-utils");

export const tokens = (n) => {
  return new Web3Utils.toBN(Web3Utils.toWei(n.toString(), "ether"));
};

export const EVM_REVERT =
  "Returned error: VM Exception while processing transaction: revert";

export const EVM_INVALID_ADDRESS =
  'invalid address (arg="_to", coderType="address", value=0)';
