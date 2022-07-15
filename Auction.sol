//SPDX-License-Identifier:MIT
pragma solidity 0.8.0;
contract Auction{
    address payable public auctioneer;
    uint public stblock;         
    uint public etblock;

    enum auc_state{Started , Running , End , Cancelled}
    auc_state public  auctionstate;
    // uint public HighestBid;
    uint public HighestPayableBid;
    uint public BidInc;

    address payable public  highestBidder;

    constructor(){
        auctioneer = payable(msg.sender);
        auctionstate = auc_state.Running;
        stblock = block.number;
        etblock = stblock + 240;  // suppose we auction for 1 hour = 240 blocks
        BidInc = 1 ether;

    }

    mapping (address=>uint) public bids;

    //Control Statements
    modifier  notOwner(){
        require(msg.sender != auctioneer,"Owner cannot Allowed");
        _;
    }
    modifier  Owner(){
        require(msg.sender == auctioneer,"Only Owner Allowed");
        _;
    }
    modifier  Started(){
        require(block.number > stblock);
        _;
    }
    modifier  beforeEnding(){
        require(block.number < etblock);
        _;
    }

    //Main

    function min(uint a, uint b) private pure returns(uint){
            return a > b?a:b;
    }
    function End_Auc() public Owner{
        auctionstate = auc_state.End;
    }
    function Cancel_Auc() public Owner{
        auctionstate = auc_state.Cancelled;
    }
    function BID() payable public notOwner Started beforeEnding
    {
        require(auctionstate == auc_state.Running);
        require(msg.value >= 1 ether);

        uint curr_bid = bids[msg.sender] + msg.value;

        require(curr_bid > HighestPayableBid);
        bids[msg.sender] = curr_bid;

        if(curr_bid < bids[highestBidder]){
            HighestPayableBid = min( (curr_bid + BidInc), bids[highestBidder]); 
        }
        else{
            HighestPayableBid = min( curr_bid, ( bids[highestBidder]+BidInc ) );
            highestBidder = payable(msg.sender);
        }

    }

    function finalize_Auc() public{
        require(auctionstate == auc_state.Cancelled || auctionstate == auc_state.End|| block.number > etblock );
        require(auctioneer == msg.sender || bids[msg.sender] > 0);

        address payable person;
        uint value;
        if(auctionstate == auc_state.Cancelled){
            person = payable(msg.sender);
            value = bids[msg.sender];
        }
        else {
            if(msg.sender == auctioneer){
                person = auctioneer;
                value = HighestPayableBid;
            }
            else{
                if(msg.sender == highestBidder){
                    person = highestBidder;
                    value = bids[highestBidder] - HighestPayableBid;
                }
                else{
                    person = payable(msg.sender);
                    value= bids[msg.sender];
                }
            }
        }
        bids[msg.sender]=0;
        person.transfer(value);
    }
    
}