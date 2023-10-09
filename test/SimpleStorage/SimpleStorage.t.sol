// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "../../src/SimpleStorage/SimpleStorage.sol";
import {DeploySimpleStorage} from "../../script/SimpleStorage/DeploySimpleStorage.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract SimpleStorageTest is Test {
    SimpleStorage s_SimpleStorage;
    address public constant USER = address(1);

    function setUp() public {
        DeploySimpleStorage deploy = new DeploySimpleStorage();
        s_SimpleStorage = deploy.run();
        vm.deal(USER, 10 ether);
    }

    function testStoreShouldStoreTheNumber() public {
        vm.prank(USER);
        s_SimpleStorage.store(69);
        assertEq(s_SimpleStorage.retrieve(), 69);
    }

    function testNumberToNameShouldWork() public {
        vm.prank(USER);
        s_SimpleStorage.addPerson("Krishang", 69);
        assertEq(s_SimpleStorage.retrieveNumberFromName("Krishang"), 69);
    }
}
