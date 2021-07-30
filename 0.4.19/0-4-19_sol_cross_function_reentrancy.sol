pragma solidity ^0.4.19;

contract Storage {

    mapping (address => uint) private userBalances;
    
    function transfer(address to, uint amount) internal  {
        if (userBalances[msg.sender] >= amount) {
           userBalances[to] += amount;
           userBalances[msg.sender] -= amount;
        }
    }
    
    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        require(msg.sender.call.value(amountToWithdraw)(""));// At this point, the caller's code is executed, and can call transfer()
        userBalances[msg.sender] = 0;
    }
}