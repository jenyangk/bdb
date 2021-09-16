// Deposit & Withdraw Funds
// Manage Orders - Make or Cancel
// Handle Trades - Charge Fees

pragma solidity ^0.5.0;

contract Exchange {
    // The account that receives exchange fees
    address public feeAccount;
    // Fee percentage charged for trading
    uint256 public feePercent;

    constructor(address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
    }
}
