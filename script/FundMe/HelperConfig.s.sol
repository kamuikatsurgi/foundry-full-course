// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "../../lib/forge-std/src/Script.sol";
import {MockV3Aggregator} from "../../test/FundMe/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getEthMainnerConfig();
        } else {
            activeNetworkConfig = getAnvilConfig();
        }
    }

    struct NetworkConfig {
        address priceFeed;
    }

    function getSepoliaConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getEthMainnerConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory ethMainnetConfig = NetworkConfig({
            priceFeed : 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethMainnetConfig;
    }

    function getAnvilConfig() public returns (NetworkConfig memory) {
        //Deploy the mocks
        //Return the mocks
        vm.startBroadcast();
        MockV3Aggregator mockFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
        vm.stopBroadcast();
        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed : address(mockFeed)
        });
        return anvilConfig;
    }
}