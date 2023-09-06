// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
import {Script} from "forge-std/Script.sol";
import  {SimpleStorage} from "../src/SimpleStorage.sol";
import "forge-std/console.sol";
contract DeploySimpleStorage is Script {

    function run() external returns(SimpleStorage) {
        vm.startBroadcast();
        SimpleStorage instance = new SimpleStorage();
        console.logAddress(address(instance));
        vm.stopBroadcast();
        return instance;
    }
}