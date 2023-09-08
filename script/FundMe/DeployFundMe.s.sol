// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "../../lib/forge-std/src/Script.sol";
import {FundMe} from "../../src/FundMe/FundMe.sol";
import {HelperConfig} from "../../script/FundMe/HelperConfig.s.sol";

contract DeployFundMe is Script {

    function run() public returns (FundMe){

        HelperConfig helperConfig = new HelperConfig();
        (address ethUsdPriceFeed) = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}