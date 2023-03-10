// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract DogCoin {
    uint256 totalSupply;
    address owner;

    event TotalSupplyIncrease(uint256);
    event Transfer(address, uint256);

    mapping (address => uint256) public balances;
    mapping (address => Payment[]) public payments;

    struct Payment {
        address recipient;
        uint256 amount;
    }

    constructor() {
        owner = msg.sender;
        totalSupply = 2000000;
        balances[owner] = totalSupply;
    }

    modifier onlyOwner {
        require (msg.sender == owner, "Not Allowed"); 
        _;
    }
    
    function getSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit TotalSupplyIncrease(totalSupply);
    }
    
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        payments[msg.sender].push(Payment(_to, _value));
        emit Transfer(_to, _value);
    }
    
    function getTransferHistory(address _from) public view returns (Payment[] memory) {
        return payments[_from];
    }
}