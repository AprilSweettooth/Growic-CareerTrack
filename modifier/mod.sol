pragma solidity ^0.8.13;

contract MyContract{

    address public owner;
    uint public Fee;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public balances;

    function deposit(uint256 amount) public payable{
        balances[msg.sender] += msg.value; 
    }

    function checkBalance(
    ) public view returns(uint256){
        return address(this).balance;
    }
    
    struct User{
        string  name;
        uint256 age;
    }

    User[] public user;

    function setUserDetails(string calldata name, uint256 age) public onlyOwner {
            
            user.push(User(name, age));

    }

    function getUserDetail(string name) public view returns (address,string memory,uint256){
        
        return(user[name].name, user[name].age);

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier validBalance(uint _amonut) {
        require(balances[msg.sender]>= 0, "Not enough ether");
        _;
    }

    modifier value(uint256 _amount) {
        if (value(_amount) < Fee)
            revert AmountToSmall();
    }

    function withdraw(uint _amount) onlyOwner {

        balances[msg.sender] -= _amount;

        (bool sent,) = msg.sender.call{value: _amount}("Sent");
        require(sent, "failed to send ETH");

    }

    function addFund(uint _amount) validBalance {
       balances[msg.sender] = balances[msg.sender] + _amount; 
    }

}