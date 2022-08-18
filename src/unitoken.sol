// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "solmate/tokens/ERC20.sol";
// import "openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";


contract UinToken is ERC20 { 
    constructor (
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSupply,
        address _owner
    ) ERC20 (_name, _symbol, _decimals) {
        totalSupply = _totalSupply;
        _mint(_owner, _totalSupply);
    }
}
