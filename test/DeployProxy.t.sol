// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "src/IUnitoken.sol";
import "src/DeployProxy.sol";
import "src/unitoken.sol";
import "openzeppelin-contracts/contracts/interfaces/IERC20.sol";

import "forge-std/Test.sol";

contract TestProxy is Test {
    TokenFactory internal factory;
    UinToken internal token;

    function setUp() public {
        token = new UinToken();
        factory = new TokenFactory(address(token));
    }

    function testOwnerSetAddress() public {
        factory.setTokenAddress(address(1));
        assertEq(factory.tokenAddress(), address(1));
    }

    function testFailOwnerSetAddress() public {
        vm.startPrank(address(0xd));
        factory.setTokenAddress(address(1));
        vm.stopPrank();
    }

    function deployToken() internal returns (address) {
        UinToken.InitArgs memory args;
        args.name = "TEST";
        args.symbol = "TET";
        args.decimals = 6;
        args.totalSupply = 1_000_000_000;
        args.owner = address(1);
        address tokenAddress = factory.cloneTokenContract(args);
        return tokenAddress;
    }

    function testProxyOwnerBalance() public {
        address tokenAddress = deployToken();
        assertEq(IERC20(tokenAddress).balanceOf(address(1)), 1_000_000_000);
    }
}
