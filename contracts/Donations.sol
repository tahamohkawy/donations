pragma solidity ^0.4.11;


 contract  Donations {
   
    address beneficiary;
    uint totalDonations;
    mapping (address  => uint) donations;
    
    function Donations() public{
        beneficiary = msg.sender;
    }

    //Fallback function
    function () payable public{
        revert();
    }

    function donate() payable public {

        require(msg.value > 0);
        
        if(donations[msg.sender] > 0) {
            donations[msg.sender]+=msg.value;
        }else {
            donations[msg.sender] = msg.value;
        }

        totalDonations+=msg.value;
    }

    function takeTheDonations() public {
        if(msg.sender == beneficiary) {
            uint amount = totalDonations;
            totalDonations = 0;
            beneficiary.transfer(amount);
        }
    }
    
}