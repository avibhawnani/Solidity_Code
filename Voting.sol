// SPDX-License-Identifier:MIT
pragma solidity 0.8.0;
contract Voting{
    
    struct Vote{
        address voterAddress;
        bool choice;
    }
    struct Voter{
        string voterName;
        bool voterChoice;
    }

    uint private countResult;
    uint public finalResult;
    uint public totalVoter;
    uint public totalVote;

    address public OfficialAddress;
    string public officialName;
    string public proposal;

    mapping(uint=>Vote) private votes;         // 1-> VoteA  2->VoteB
    mapping(address=>Voter) private voterRegistered;   //0x0.. -> VoterA   ,  0x1.. -> VoterB  

    enum States{Created,VotingStarted,VotingEnded} 
    States public state;

    modifier onlyOfficial(){
        require(msg.sender == OfficialAddress,"You are not the official");
        _;
    }

    modifier inState(States _st){
        require(state == _st,"Different State");
        _;
    }

    constructor(string memory _offName,string memory _prop){
        countResult=0;
        finalResult=0;
        totalVote=0;
        totalVoter=0;
        OfficialAddress = msg.sender;
        officialName = _offName;
        proposal = _prop;
        state = States.Created;
    }

    function addVoter(address _vAddress,string memory _vName)public inState(States.Created) onlyOfficial{
        Voter memory v;
        v.voterName = _vName;
        v.voterChoice = false;
        voterRegistered[_vAddress] = v;
        totalVoter++; 
    }
    function startVote() onlyOfficial inState(States.Created) public {
        state = States.VotingStarted;
    }

    function doVote(bool _ch) inState(States.VotingStarted) public returns(bool){
        bool flag = false;
        string memory name = voterRegistered[msg.sender].voterName;
        if(bytes(name).length !=0 && voterRegistered[msg.sender].voterChoice == false){
                voterRegistered[msg.sender].voterChoice = true;
                Vote memory v;
                v.voterAddress = msg.sender;
                v.choice = true;
                if(_ch){
                    countResult++;
                }
                votes[totalVote] = v;
                totalVote++;
                flag = true;
        }
        return flag;
    }

    function endVote()public onlyOfficial inState(States.VotingStarted) {
        state = States.VotingEnded;
        finalResult = countResult;
    }
}
