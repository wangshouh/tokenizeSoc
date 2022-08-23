// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IUnitoken {
    struct InitArgs {
        string  name;
        string  symbol;
        uint8 decimals;
        uint256 totalSupply;
        address owner;
    }

    function initialize(InitArgs memory _args) external;
}