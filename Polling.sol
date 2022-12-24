// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;
contract Polling{

    struct Voter{
        string voterName;
        bool voted;
    }

    struct Choice{
        string Name;
        uint voteCount; 
    }

    uint public totalVoter;
    address private OfficialAddress;
    string private statement;

    mapping(address=>Voter) private voters;
    Choice[] private choices;
    mapping(string => uint) private choice_index;

    enum States{Created,VotingStarted,VotingEnded} 
    States private state;

    modifier onlyOfficial(){                    
        require(msg.sender == OfficialAddress,"You are not the official");
        _;
    }

    modifier inState(States _st){
        require(state == _st,"Different State");
        _;
    }

    constructor(string[] memory choiceNames,string memory _st){
        OfficialAddress = msg.sender;   
        totalVoter = 0;
        statement = _st;
        state = States.Created;

        for(uint i=0; i<choiceNames.length;i++){
            choices.push(Choice({
                Name: choiceNames[i],
                voteCount:0
            }));
            choice_index[choiceNames[i]] = i;
        }
    }

    function startVote() onlyOfficial inState(States.Created) public {
        state = States.VotingStarted;
    }

    function endVote()public onlyOfficial inState(States.VotingStarted) {
        state = States.VotingEnded;
    }

    function Vote(string memory _choice,string memory _vName) inState(States.VotingStarted) public{
        require(msg.sender != OfficialAddress,"The official cannot vote.");
        Voter storage User = voters[msg.sender];
        require(User.voted == false,"Already Voted");
        User.voted = true;
        User.voterName = _vName;
        choices[choice_index[_choice]].voteCount += 1;
        totalVoter++;
    }   

    function CalcResultDeclare() inState(States.VotingEnded) onlyOfficial internal view returns (uint winningChoice){
        uint winningVoteCount = 0;
        for(uint p=0;p<choices.length;p++){
            if(choices[p].voteCount > winningVoteCount){
                winningVoteCount = choices[p].voteCount;
                winningChoice = p;
            }
        }

    }

    function ResultDeclare() public view returns(string memory _WinnerChoice){
        uint winner = uint(CalcResultDeclare());
        _WinnerChoice =  choices[uint(winner)].Name;   
    }

}
