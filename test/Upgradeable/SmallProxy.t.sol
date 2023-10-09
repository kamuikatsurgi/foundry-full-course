// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SmallProxy, ImplementationA, ImplementationB} from "../../src/Upgradeable/SmallProxy.sol";
import {Test, console} from "forge-std/Test.sol";

contract SmallProxyTest is Test {
    SmallProxy proxy;
    ImplementationA impA;
    ImplementationB impB;

    function setUp() public {
        proxy = new SmallProxy();
        impA = new ImplementationA();
        impB = new ImplementationB();
        proxy.setImplementation(address(impA));
    }

    function testIsCorrectImplementationAddress() public {
        address impl = proxy.getImplementation();
        assertEq(impl, address(impA));
    }

    function testDelegatingandChecking() public {
        bytes memory data = proxy.getDataToTransact(96);
        (bool success, ) = address(proxy).call(data);
        assertEq(success, true);
        assertEq(proxy.readStorage(), 96);
    }

    function testDelegatingandCheckingTwo() public {
        proxy.setImplementation(address(impB));
        bytes memory data = proxy.getDataToTransact(96);
        (bool success, ) = address(proxy).call(data);
        assertEq(success, true);
        assertEq(proxy.readStorage(), 98);
    }
}
