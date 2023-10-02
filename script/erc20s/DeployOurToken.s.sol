// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {OurToken} from "../../src/erc20s/OurToken.sol";
import {Script} from "forge-std/Script.sol";

contract DeployOurToken is Script {
    uint256 constant INITIAL_SUPPLY = 1000e18;

    function run() public returns (OurToken) {
        vm.startBroadcast();
        OurToken token = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }
}
