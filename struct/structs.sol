pragma solidity ^0.8.13;

contract StudentRegister{

    address private owner;

    mapping (address=>user)users;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

    struct user{
        address userId;
        string  name;
        uint256 age;
        bool isExist;
    }

    function setUserDetails(string calldata name, uint256 age) public onlyOwner {
        // check authorization details for the setting
            require(users[userId].isExist==false,"user details already registered");
        // updates
            users[userId]=user(suserId,name,age,true);
    }

    function getUserDetail(address userID) public view returns (address,string memory,uint256){
        return(users[userId].userId,users[userId].name,users[userId].age);
    }
}
// overall may I ask for how to implement gas optimization for the contract?