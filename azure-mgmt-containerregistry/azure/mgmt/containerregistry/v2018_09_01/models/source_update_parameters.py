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


class SourceUpdateParameters(Model):
    """The properties for updating the source code repository.

    :param source_control_type: The type of source control service. Possible
     values include: 'Github', 'VisualStudioTeamService'
    :type source_control_type: str or
     ~azure.mgmt.containerregistry.v2018_09_01.models.SourceControlType
    :param repository_url: The full URL to the source code repository
    :type repository_url: str
    :param branch: The branch name of the source code.
    :type branch: str
    :param source_control_auth_properties: The authorization properties for
     accessing the source code repository and to set up
     webhooks for notifications.
    :type source_control_auth_properties:
     ~azure.mgmt.containerregistry.v2018_09_01.models.AuthInfoUpdateParameters
    """

    _attribute_map = {
        'source_control_type': {'key': 'sourceControlType', 'type': 'str'},
        'repository_url': {'key': 'repositoryUrl', 'type': 'str'},
        'branch': {'key': 'branch', 'type': 'str'},
        'source_control_auth_properties': {'key': 'sourceControlAuthProperties', 'type': 'AuthInfoUpdateParameters'},
    }

    def __init__(self, **kwargs):
        super(SourceUpdateParameters, self).__init__(**kwargs)
        self.source_control_type = kwargs.get('source_control_type', None)
        self.repository_url = kwargs.get('repository_url', None)
        self.branch = kwargs.get('branch', None)
        self.source_control_auth_properties = kwargs.get('source_control_auth_properties', None)
