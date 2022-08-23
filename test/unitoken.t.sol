// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/unitoken.sol";

contract TestContract is Test {
    UinToken internal token;

    function setUp() public {
        token = new UinToken();
        UinToken.InitArgs memory args;
        args.name = "TEST";
        args.symbol = "TET";
        args.decimals = 6;
        args.totalSupply = 1_000_000_000;
        args.owner = address(1);
        token.initialize(args);
    }

    function testOwnerBalance() public {
        assertEq(token.balanceOf(address(1)), 1_000_000_000);
    }
}
