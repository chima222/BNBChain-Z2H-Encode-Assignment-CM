// SPDX-License-Identifier: None

pragma solidity 0.8.17;

//  answer to part 1
contract BootcampContract {

    uint256 number;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function deployer() external view returns(address) {
        if (msg.sender == owner) {
            return address(0x000000000000000000000000000000000000dEaD);
        }
        return owner;
    }

    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }
}
// answer to part 2