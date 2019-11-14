pragma solidity ^0.4.25; 
 
contract Auction {     
    address public highestBidder; // The highest bidder's address
    uint public highestBid; // The amount of the highest bid
    mapping(address => uint) public userBalances;  // mapping for the amount to return 
 
    constructor() public {    
        //Highest bid and highest bidder set to initializing address
        highestBid = 0;
        highestBidder = msg.sender;     
    } 
 
    // Funtion to process bid 
    function bid() public payable {           
        //Check if the bid is greater than the current highest bid  
        if(msg.value > highestBid) { 
            
            //Return the former highest bids funds
            withdraw(); 

            //Update status variables 
            highestBid = msg.value;
            highestBidder = msg.sender;
        }    
    }     
        
    // Fundtion to return the bid of a previous highest bid.
    function withdraw() public {         
        // Check if the amount to return is greater than zero  
        if(highestBid > 0) { 
            //Return bid 
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