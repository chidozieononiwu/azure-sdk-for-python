# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from msrest.serialization import Model


class VpnProfileResponse(Model):
    """Vpn Profile Response for package generation.

    :param profile_url: URL to the VPN profile
    :type profile_url: str
    """

    _attribute_map = {
        'profile_url': {'key': 'profileUrl', 'type': 'str'},
    }

    def __init__(self, *, profile_url: str=None, **kwargs) -> None:
        super(VpnProfileResponse, self).__init__(**kwargs)
        self.profile_url = profile_url
