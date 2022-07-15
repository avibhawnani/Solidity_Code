//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract X{
    uint public a;

    constructor(){
        a=100;
    }
    function fun() public virtual{
            a=10;
    }
}

contract Y is X{
    uint public b;

    constructor(){
        a=99;
        b=200;
    }
    function fun() public virtual override{
            a=20;
    }
}

contract Z is X,Y{
         //assigns right to left inheritance

         function fun()public override(X,Y){

         }
}
