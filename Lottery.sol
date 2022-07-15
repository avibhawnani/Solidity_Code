//SPDX-License-Identifier:MIT
pragma solidity 0.8.0;

contract Lottery{
    address public mgr;
    address payable[]  public players;

    constructor(){
        mgr=msg.sender;
    }

    function alreadyEntered() private view returns(bool){
        for(uint i=0;i<players.length;i++){
            if(players[i]==msg.sender){
                return true;
            }
        }
        return false;
    }
    function ENTER() public payable{
        require(msg.sender!=mgr,"Manager cannnot enter");
        require(alreadyEntered() == false ," Player already Entered!");
        require(msg.value >= 1 ether,"Insufficient balance!");

        players.push(payable(msg.sender));
    }

    function random()private view returns(uint)                    //Generate Random Number
    {
        return uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
    }

    function pickWinner() payable public{

        require(msg.sender==mgr,"Only Manager can pick.");
        uint index = random()%players.length;
        address contractAddress = address(this);
        players[index].transfer(contractAddress.balance);
        players = new address payable[](0);    //reset the lottery
    }
    function getplayers() public view returns(address payable[] memory ){
        return players;
    }

}
