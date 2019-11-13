pragma solidity ^0.4.25; 
 
contract CrowdFunding {     
    // Investor struct     
    struct Investor {         
        
        address addr;// investor's address         
        
        uint amount; // investment amount     
    }     
        
    address public owner; // contract owner     
    
    uint public numbInvestors; // the number of investors     
    
    uint public deadline;  // deadline for this contract to be closed     
    
    string public status; // "Funding", "Campagin Success", "Campain Failed"     
    
    bool public isOver;  // the end of funding      
    
    uint public goalAmount; // target amount     
    
    uint public totalAmount;  //total ammout     
    
    mapping(uint => Investor) public investors;   
     
    
    // 1. Create modifier to limit to owner          
        
    // Constructor     
    constructor(uint _duration, uint _goalAmount) public {  
        // Initialize owner, deadline, goalAmount, status, end, numbInvestors, totoalAmount     
        owner = msg.sender;
        deadline = getNow() + _duration;
        goalAmount = _goalAmount;
        status = "Funding";
        isOver = false;
        numbInvestors = 0;
        totalAmount = 0;
    }       
            
    // Function to be called when investing     
    function fund() public payable {  
    // 1. Check if this crowd funding ended or not  
    // 2. Set invest-related info and process funding

        if(isOver) { 
            msg.sender.transfer(msg.value);
            return;
        }

        Investor memory investor;
        investor = Investor({addr: msg.sender, amount: msg.value}); 
        numbInvestors++;
        investors[numbInvestors] = investor;
        totalAmount += msg.value;

        checkGoalReached();
    }          
    
    function checkGoalReached () public {          
    // 1. Check if this crowd funding ended or not          
    if(isOver) { return;} 
    // 2. Check if the deadline is past or not  
    if(getNow() > deadline) {
        isOver = true;
    }         

    uint totalAmountAsETH = totalAmount / 1000000000000000000; 
    // 3-1. If this crowd funding is successful, send funded ETH to owner  
    if(totalAmountAsETH >= goalAmount) { 
        owner.transfer(totalAmount);
        status = "Campaign Succes";
        isOver = true;
    }
    // 3-2. If not, return fund-raising to each investor
    if(totalAmountAsETH < goalAmount && isOver) {
        for(numbInvestors; numbInvestors > 0; numbInvestors--) { 
            Investor memory investor;
            investor = investors[numbInvestors];
            address returnAddress = investor.addr;
            uint amountToReturn = investor.amount;
            returnAddress.transfer(amountToReturn);
        }
        status = "Campaign Failed";
        isOver = true;
        }
      
    }          
    
    // 1. Create function to destroy this contract 
    // inspired by https://ethereumdev.io/ethereum-smart-contracts-lifecycle/
    function kill() public {
       if (owner == msg.sender) { // Only privillige of owner
          selfdestruct(owner); //destroy contract
       }
    }


    
    function getNow() public view returns (uint256) { 
        return now;
    }   

     function getIsOver() public view returns (bool) { 
        return isOver;
    } 

     function getDeadline() public view returns (uint) { 
        return deadline;
    }   

    function getTotalFunding() public view returns (uint) { 
        return totalAmount; 
    }


    function getFundingFromInvestor(uint investorNum) public view returns(uint) { 
        Investor memory investor;
        investor = investors[investorNum];
        return investor.amount;
    }

    
    function getStatus() public view returns (string) { 
        return status;
    }

} 