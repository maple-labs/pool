pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./Pool.sol";

contract PoolTest is DSTest {
    Pool pool;

    function setUp() public {
        pool = new Pool();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
