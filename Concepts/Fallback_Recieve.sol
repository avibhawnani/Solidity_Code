// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
contract fallBack_Receive{


    fallback() external payable{}
    receive() external payable{}

    function checkBal() public view returns(uint){
        return address(this).balance;
    }
}
