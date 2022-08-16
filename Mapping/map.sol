pragma solidity ^0.8.13;     

contract MyContract
{
    address private owner;

    mapping (address=>user)users;

    constructor() public{   
        owner=msg.sender;
    }

    struct student{
        address userId;
        uint256 balance;
    }

    function deposit (uint256 amount) public onlyOwner {
        users[userId] += amount;
    }

    function checkBalance(
    ) public view returns(uint256){
        return owner.balance;
    }
}