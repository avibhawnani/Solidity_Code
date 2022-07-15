//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract demo1{
    uint [] public arr;
    function push(uint item)public{
        arr.push(item);  //appends element at last
    }
    function length()public view returns(uint){
        return arr.length;
    }
    function pop()public{ // pop deletes the last element but
    //                       delete keyword deletes at specific position and makes its value 0.
        delete arr[1];
        return arr.pop();

    }
}