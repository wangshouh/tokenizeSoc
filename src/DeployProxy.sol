// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/proxy/Clones.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "./IUnitoken.sol";

contract TokenFactory is Ownable {
    event TokenDeploy(address indexed tokenOwner, address indexed tokenAddress);

    address public tokenAddress;

    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
    }

    function setTokenAddress(address _newAddress) public onlyOwner {
        tokenAddress = _newAddress;
    }

    function cloneTokenContract(IUnitoken.InitArgs memory args)
        public
        returns (address)
    {
        address newToken = Clones.clone(tokenAddress);
        IUnitoken(newToken).initialize(args);
        emit TokenDeploy(args.owner, newToken);
        
        return newToken;
    }
}
