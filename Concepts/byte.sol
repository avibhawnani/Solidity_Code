//SPDX-License-Identifier:GPL:3.0
pragma solidity 0.8.0;
contract demo3{
     bytes2 public b2;
     bytes3 public b3;

     function setter() public{
         b3='abc';
         b2='ab'; 
     }
     function getItem()public view returns(bytes3){
         return b3[0];
     }
     function getlength()public view returns(uint){
         return b3.length;
     }
}