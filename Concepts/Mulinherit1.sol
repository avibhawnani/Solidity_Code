//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract A{
    uint public a;

    constructor(){
        a=100;
    }
    function funA() public{
            a=10;
    }
}

contract B is A{
    uint public b;

    constructor(){
        a=99;
        b=200;
    }
    function funB() public{
            b=20;
    }
}

contract C is A,B{     //assigns right to left inheritance
}
