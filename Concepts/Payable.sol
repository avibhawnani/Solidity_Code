//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;

contract Payable{


    address payable public Owner = payable(msg.sender);

    constructor() payable{

    }

    function getEth() public payable{

    }
    function checkBal() public view returns(uint){
        return address(this).balance;
    }
}