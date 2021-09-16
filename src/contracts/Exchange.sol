// Deposit & Withdraw Funds
// Manage Orders - Make or Cancel
// Handle Trades - Charge Fees

pragma solidity ^0.5.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "./Token.sol";

contract Exchange {
    using SafeMath for uint256;

    // The account that receives exchange fees
    address public feeAccount;
    // Fee percentage charged for trading
    uint256 public feePercent;

    // Store Ether in tokens mapping with blank address
    address constant ETHER = address(0);

    // Token address -> User that deposited -> Amount
    mapping(address => mapping(address => uint256)) public tokens;

    // Events
    event Deposit(
        address indexed token,
        address indexed user,
        uint256 amount,
        uint256 balance
    );

    constructor(address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
    }

    function() external {
        revert();
    }

    function depositEther() public payable {
        tokens[ETHER][msg.sender] = tokens[ETHER][msg.sender].add(msg.value);
        // Emit event
        emit Deposit(ETHER, msg.sender, msg.value, tokens[ETHER][msg.sender]);
    }

    // Must approve token before you can deposit
    function depositToken(address _token, uint256 _amount) public {
        // Don't allow Ether deposits
        require(_token != ETHER);
        // Send token to this contract
        require(Token(_token).transferFrom(msg.sender, address(this), _amount));
        // Manage deposit
        tokens[_token][msg.sender] = tokens[_token][msg.sender].add(_amount);
        // Emit event
        emit Deposit(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }
}
