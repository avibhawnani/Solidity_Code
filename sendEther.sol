//SPDX-License-Identifier:MIT
pragma solidity 0.8.0;

contract sendEth{
    // address payable public getter = payable(0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB);

    receive() external payable{}

    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

    function SEND(address payable getter) public payable{
        bool sent= getter.send(msg.value);
        require(sent,"Transaction is failed!!");
    }

    function TRANSFER(address payable getter) public{
        getter.transfer(3000000000000000000);
    }

    function CALL(address payable getter) public{
        (bool sent,) = getter.call{value:1000000000000000000}("");
        require(sent,"Transaction is failed!!");
    }

}

contract GetEth{

    receive() external payable{}
    
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

}