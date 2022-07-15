//SPDX-License-Identifier:GPL-3.0

pragma solidity >=0.7.0 <0.8.0;
contract demo{
    uint [4] public arr=[10,20,30];
    function setter(uint i,uint v) public{
        arr[i]=v;
    }
    function length()public pure  returns(uint){
        uint[] memory ar1=new uint[](3);
        ar1[1]=1;
        return ar1[1];
        
        
    }
}