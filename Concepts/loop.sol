//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract loops1{
    uint [5] public arr;
    uint public c;
    
    function loop()public{
        // while(c<arr.length){
        //     arr[c]=c;
        //     c=c+1;
        // }
        for(uint i=0;i<arr.length;i++){
            arr[i]=i;
        }
    }
}