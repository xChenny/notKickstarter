pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Campaign.sol";

contract TestCampaign {
    Campaign campaign = Campaign(DeployedAddresses.Campaign());

    function testSetGoal() public {
        uint returnedGoal = campaign.setGoal(1000);
        uint expected = 1000;
        Assert.equal(returnedGoal, expected, "Goal of 1000 (USD) should be recorded.");
    }

    function testGive() public {
        // address[1] storage backer = [expectedBackerAddress];

        // uint returnedBalance = campaign.give(100, backer);
        uint returnedBalance = campaign.give(100);
        uint returnedProgress = campaign.progress();
        // uint returnedNumBackers = campaign.numBackers;
        // address returnedBackerAddress = campaign.backers(0);

        uint expectedCash = 100;
        // uint expectedNumBackers = 1;
        // address expectedBackerAddress = this;
        

        Assert.equal(returnedBalance, expectedCash, "The current balance should be 100.");
        Assert.equal(returnedProgress, expectedCash, "The current progress (after giving $100) should be 100.");
        // Assert.equal(returnedNumBackers, expectedNumBackers, "The current number of backers should be 1.");
        // Assert.equal(returnedBackerAddress, expectedBackerAddress, "The only backer should be this transaction.");
    }

    function testSpend() public {
        uint returnedBalance = campaign.spend(25);
        uint expectedBalance = 75;

        Assert.equal(returnedBalance, expectedBalance, "The current balance should be 75.");
    }

}