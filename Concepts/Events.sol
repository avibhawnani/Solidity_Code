//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract Events{

    event balance(address addrs,string message,uint value);

    function storeData(uint _val) public{
        emit balance(msg.sender,"has value",_val);
    }
}


contract chatApp{

    event chat(address indexed _from,address _to,string _message);

    function sendMessage(address _to,string memory _message) public{
        emit chat(msg.sender,_to,_message);
    }
}