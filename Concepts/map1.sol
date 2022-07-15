//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract demo{
    mapping(uint=>string) public roll_no;
    function setter(uint key,string memory value)public{
        roll_no[key]=value;
    }
    
}