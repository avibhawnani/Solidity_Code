//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0;
contract demo4{
    enum names{ram,shyam,dharam}
    names public n1=names.dharam;
    uint public lottery=1000;
    function owner()public{
        if(n1==names.dharam)
        {
            lottery=0;
        }
    }
    function changeOwner() public{
        n1=names.shyam;
    }
}