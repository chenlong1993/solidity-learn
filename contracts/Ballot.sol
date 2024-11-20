// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Ballot{
    //定义一个投票者
    struct Voter {
         uint weight;
         bool voted;
         address delegate;
         uint vote;
    }
    //定义个人
    struct Proposal{
        bytes32 name;
        uint voteCount;
    }
    
    address public chainPerson;
    //每一个地址对应一个Voter
    mapping(address => Voter)public voters;

    Proposal[] public proposals;

    constructor(bytes[] memory proposalNames){
        chainPerson = msg.sender;
        voters[chainPerson].weight = 1;
        for(uint i = 0; i < proposalNames.length; i++){
            proposals.push(Proposal({
                name: bytes32(proposalNames[i]),
                voteCount: 0
            }));
         }
         
    }
    function giveRightToVote(address voter) external {
        require(
            msg.sender == chainPerson,
            "only chainPerson can give right to vote"
        );
        if (voters[voter].weight != 0 && !voters[voter].voted){
            revert("The voter already voted.");
        }
            voters[voter].weight = 1; //打标，已经投递过
    }

    function delegate(address to) external {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "you have been voted");
        require(!sender.voted,"you have been voted");
        require(to != msg.sender,"you cannot vote yourself");

        while(voters[to].delegate != address(0)){
            to = voters[to].delegate;//委托下级
            require (to != msg.sender,"find loop"); 
        }

        Voter storage delegate_  = voters[to];//取出地址，赋值
        
        require(delegate_.voted==true);
        sender.voted = true;
        sender.delegate = to;

        if (delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        }else{
            delegate_.weight += sender.weight;
        }
    }
    function vote(uint proposal) external {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0,"you privliage");
        require(!sender.voted,"you have been voted");
        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }
    function winningProposal() public view returns(uint winningProposal_) {
       uint winningVoteCount = 0;
       for(uint p = 0;p<proposals.length;p++){
        if(proposals[p].voteCount>winningVoteCount){
            winningProposal_ = p;
            winningVoteCount = proposals[p].voteCount;
        }
       }
    }

    function winnerName() external view returns(bytes32 winnerName_){
        winnerName_ = proposals[winningProposal()].name;
    }
    
}