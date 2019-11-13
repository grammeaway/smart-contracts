pragma solidity ^0.4.25; 
 
contract Auction {     
    address public highestBidder; // The highest bidder's address
    uint public highestBid; // The amount of the highest bid
    mapping(address => uint) public userBalances;  // mapping for the amount to return 
 
    constructor() public {  
        // contractor  
        // 1. Initialize highest bid and the bidder's address
        highestBid = 0;
        highestBidder = msg.sender;     
    } 
 
    function bid() public payable {  
        // Funtion to process bid  
        // 1. Check if the bid is greater than the current highest bid  
        // 2. Update status variable and the amount to return 
        if(msg.value > highestBid) { 
            withdraw();
            highestBid = msg.value;
            highestBidder = msg.sender;
    
            }    
    }     
        
    function withdraw() public {         
        // Fundtion to withdraw the amount of bid to return  
        // 1. Check if the amount to return is greater than zero  
        // 2. Update status variablle and return bid 
        if(highestBid > 0) { 
            highestBidder.transfer(highestBid);
        }

    } 

    function getHighestBid() public constant returns(uint) { 
        return highestBid;
    }

    function getHighestBidder() public constant returns(address) { 
        return highestBidder;
    }  
} 