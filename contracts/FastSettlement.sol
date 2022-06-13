// SPDX-License-Identifier: Apache-2.0

/*
 * Copyright 2019-2021, Offchain Labs, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

pragma solidity 0.8.4;

abstract contract FastSettlement {
    address public immutable tokenAddress;
    mapping(uint256 => bool) internal isSettlement;
    mapping(uint256 => address) internal lenter;

    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
    }

    function _onlyApprovedSources(address _sourceSender, uint256 _sourChainId)
        internal
        view
        virtual;

    function crossDomainMassage(
        address _destAddress,
        uint256 _destChainID,
        bytes memory _destMassage
    ) internal {
        // IDock_L2(dockAddr).callOtherDomainFunction(_destAddress, _destChainID, _destMassage);
    }
}
