pragma solidity ^0.8.13;

contract StudentRegister{

    address public owner;

    mapping (address=>student)students;

    constructor() public {
        owner=msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

    struct student{
        address studentId;
        string  name;
        string course;
        uint256 mark;
        bool isExist;
    }

    function register(address studentId,string memory name,string memory course,uint256 mark) public onlyOwner {

            require(students[studentId].isExist==false,"student details already registered");

            Mark=mark;

            students[studentId]=student(studentId,name,course,mark,true);
    }

    function getStudentDetails(address studentId) public view returns (address,string memory,string memory,uint256){
        return(students[studentId].studentId,students[studentId].name,students[studentId].course,students[studentId].Mark);
    }
}