//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract RevertAndAssert
{

    address public owner = msg.sender;
    uint public age=15;
//revert
    error MyError(string _msg,address _user);

    function checkRevert(uint _x) public{
        age=age + 6;
        if (_x<2)
        {
        revert MyError("Error",msg.sender);
        }
    }

    //assert
    function checkAssert() public view{
        assert(owner!=0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
    }
}

