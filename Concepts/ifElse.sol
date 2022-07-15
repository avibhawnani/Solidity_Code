//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract ifelse{
    function fun(int a)public pure returns(string memory){
        string memory val;
        if(a>0){
            val="greater than zero";
        }
        else if(a==0){
            val="equal zero";
        }
        else{
            val="less than zero";
        }
        return val;
    }
}