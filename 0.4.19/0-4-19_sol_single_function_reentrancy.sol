pragma solidity ^0.4.19;

contract Storage {

    mapping (address => uint) private userBalances;
    
    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        require(msg.sender.call.value(amountToWithdraw)("")); // At this point, the caller's code is executed, and can call withdrawBalance again
        userBalances[msg.sender] = 0;
    }
}