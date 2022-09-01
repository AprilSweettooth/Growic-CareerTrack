pragma solidity ^0.8.7;

error NotcontractOwner();
error HasNotdeposited(string message);
error AmountToSmall(uint256 amount);
contract Task3 {

    address public immutable owner;
    uint256 private constant Fee = 0.01 ether; 

    struct User{
        string name;
        uint256 age;
    }

    mapping(address => User) userDetails;

    mapping(address => uint256) balance;

    modifier onlyOwner() {
       if(msg.sender != owner){
           revert NotcontractOwner();
       }
       _;
    }
    modifier hasDeposited(){
        if(balance[msg.sender] <= 0){
            revert HasNotdeposited("Please you must deposit first using the deposit funcion");
        }
        _;
    }
    modifier checkAmount(uint256 _amount){
        if(_amount < Fee) {
            revert AmountToSmall(_amount);
        }
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint256 amount) public {
        balance[msg.sender] += amount;
    }

    function checkBalance() public view returns(uint256){
        return balance[msg.sender];
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        userDetails[msg.sender] = User(_name, _age);
    }

    function getUserDetail() public view returns(User memory){
        return userDetails[msg.sender];
    }

    function withdraw() public onlyOwner {
        uint256 amt = balance[msg.sender];
        balance[msg.sender] -= amt;
    }

    function addFund(uint256 _amount) public hasDeposited checkAmount(_amount){
       balance[msg.sender] += _amount;
    }

    function receiveMoney() public payable {
        balance[msg.sender] += msg.value;
    }

    receive() external payable {
        receiveMoney();
    }
}