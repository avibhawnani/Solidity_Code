//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract demo{
    struct Student
    {
        string name;
        uint class;
    }
    mapping(uint=>Student) public data;
    function setter(uint _roll,string memory _name,uint _class)public{
        data[_roll]= Student(_name,_class);
    }
    function nums()public view returns(uint blockid,uint timestamp,address msgSender){
        return (block.chainid,block.timestamp,msg.sender);
    }
    
}