//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;

contract donate{

    struct Donar{
        string name;
        uint age;
        address addr;
        uint amt;
    }
    
    mapping(address=>Donar) public acc_details;

    function setValues(string memory _name,uint _age,address _addr,uint _amt) public {
        acc_details[msg.sender]=Donar(_name, _age, _addr, acc_details[msg.sender].amt + _amt);
    }

    function deleteDonar(address _add)public{
        delete acc_details[_add];
    }
}