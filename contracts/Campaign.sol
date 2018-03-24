pragma solidity ^0.4.17;

contract Campaign {
    uint public goal;
    // progress is not the same as balance!
    // progress is the total amount of balance funded
    // balance is the current amount of money that the cause now has
    uint public progress = 0;
    uint public balance = 0;
    // address[] public backers;
    // uint public numBackers = 0;

    function setGoal(uint desiredGoal) public returns(uint) {
        // The cause will use this when they create their campaign
        goal = desiredGoal; 
        return goal;
    }

    // If I have time, I can implement backers
    // function give(uint cash, address[] backer) public returns (uint) {
    function give(uint cash) public returns (uint) {
        // The donor will use this to give money to the cause
        balance += cash;
        progress += cash;
        // idk how to make an optional argument so I'll just check if the length is 1 or 0
        // backer is optional in case the donor wants to remain anonymous
        // if (backer.length == 1) {
        //     backers[numBackers] = msg.sender;
        //     numBackers++;
        // }
        return balance;
    }

    function spend(uint cost) public returns(uint) {
        // The cause uses this to spend money
        balance -= cost;
        return balance;
    }
    // function getBackers() public view returns(address[]) {
    //     return backers;
    // }

}