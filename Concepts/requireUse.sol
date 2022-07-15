//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract RevertAndAssert
{

    address public owner = msg.sender;
    uint public age=15;
    function checkRevert(uint _x) public{
        age=age + 6;
        require(_x>20,"Error");
    }




   function OnlyOwner() public
   {
        require(owner == msg.sender,"Only owner can access");
        age=age+7;
    }
}