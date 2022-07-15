//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract Mod{


modifier samecode(){
    for(uint i=0;i<10;i++){
        //code
    }

    _;
}

function fun1()public pure returns(string memory){
    //code

    return "In fun1";
}

function fun2() public pure returns(uint _z){

    //code
    return 1;
}

function fun3() public pure returns (bool  _x) {

    //code
return true;
}
}