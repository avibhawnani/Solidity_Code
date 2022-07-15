//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract A{                // passing parameters in constructor in multiple inheritance
    string public name;
    uint public age;

    constructor(string memory _name,uint _age){
        name=_name;
        age=_age;
    }
}

contract B{
    uint public sal;

    constructor(uint _b){
        sal=_b;
    }
    
}

contract C is A("Avi",23),B(4500){     //assigns right to left inheritance     // initialize constructor method1
}
contract D is A,B{
    constructor() A("Ram",25) B(1500){}                       // initialize constructor method 2
}

contract E is A,B{
    constructor(string memory _nam,uint _a,uint _sal) A(_nam,_a+1) B(_sal){}  // initialize constructor method 3
}