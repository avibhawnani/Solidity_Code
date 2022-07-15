//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract demo{
    enum Status{Pending,Shipped,Accepted,Rejected ,
    Cancel}
    Status status;

    function getStatus() public view returns(Status){
        return status;
    }
    function setStatus(Status _s) public{
            status=_s;
    }
    function deleteStatus()public{
        delete status;
    }
    function rejectStatus() public{
        status=Status.Rejected;
    }
    
}