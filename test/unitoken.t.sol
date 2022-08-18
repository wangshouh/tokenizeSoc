// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/unitoken.sol";

contract TestContract is Test {
    UinToken internal token;

    function setUp() public {
        token = new UinToken("TEST", "TET", 6, 1_000_000_000, address(1));
    }

    function testOwnerBalance() public {
        assertEq(token.balanceOf(address(1)), 1_000_000_000);
    }
}
