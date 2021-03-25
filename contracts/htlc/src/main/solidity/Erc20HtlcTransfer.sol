/*
 * Copyright 2020 ConsenSys Software Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */
pragma solidity >=0.8.0;

import "./Erc20HtlcTransferDest.sol";
import "./Erc20HtlcTransferSource.sol";
import "../../../../openzeppelin/src/main/solidity/proxy/utils/Initializable.sol";


contract Erc20HtlcTransfer is Erc20HtlcTransferDest, Erc20HtlcTransferSource, Initializable {
    uint256 constant VERSION = 20210325;

    function initialise(uint256 _sourceTimeLock, uint256 _destTimeLock) initializer()  external {
        sourceTimeLockPeriod = _sourceTimeLock;
        destTimeLockPeriod = _destTimeLock;
        authorisedRelayer[msg.sender] = true;
    }

    function version() external pure returns (uint256) {
        return VERSION;
    }

}