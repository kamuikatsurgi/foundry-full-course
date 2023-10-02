// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {OurToken} from "../../src/erc20s/OurToken.sol";
import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../../script/erc20s/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    OurToken token;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        DeployOurToken deploy = new DeployOurToken();
        token = deploy.run();

        vm.prank(msg.sender);
        token.transfer(bob, 100e18);
    }

    function testBobBalance() public {
        assertEq(token.balanceOf(bob), 100e18);
    }
}
