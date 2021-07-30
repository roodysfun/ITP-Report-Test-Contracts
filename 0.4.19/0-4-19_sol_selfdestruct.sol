pragma solidity ^0.4.19;

contract SimpleSuicide{

  function sudicideAnyone() public{
    selfdestruct(msg.sender);
  }

}
