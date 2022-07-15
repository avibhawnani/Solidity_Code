//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;

contract FunctionMod{

    address public owner=msg.sender;

    modifier onlyowner(){
        require(owner==msg.sender,"You are not the Owner");
        _;
    }

    function startAuction() public onlyowner view{
        //code
    }

    function stopAuction() public onlyowner{
        //code
    }

    function checkstatus() public onlyowner{
        //code
    }

    uint public age=20;

    modifier temp(uint _x){
        age=age+_x;
        _;
    }
    function changeAge(uint _Y) public temp(_Y){
       
    }
}
