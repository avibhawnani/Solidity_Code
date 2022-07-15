//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract banking{
    address owner;
    struct Account{
        string acc_owner;
        string dob;
        uint balance;
        address acc_no;
    }
    constructor(){
        owner=msg.sender;
    }
    mapping(address=>Account) AccDetails;
    function createAccount(string memory _name,string memory _dob)public payable{
        require(msg.value >= 2 ether,"Insufficient Balance");
        AccDetails[msg.sender]=Account(_name,_dob,msg.value-2,msg.sender);
    }

    function getDetails()public view returns(Account memory){
        require(msg.sender==owner || msg.sender==AccDetails[msg.sender].acc_no
        ,"Not Authorized");
        return AccDetails[msg.sender];
        
        
    }

}