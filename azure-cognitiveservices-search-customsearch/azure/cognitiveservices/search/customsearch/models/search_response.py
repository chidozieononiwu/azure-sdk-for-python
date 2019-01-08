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

from .response import Response


class SearchResponse(Response):
    """Defines the top-level object that the response includes when the request
    succeeds.

    Variables are only populated by the server, and will be ignored when
    sending a request.

    All required parameters must be populated in order to send to Azure.

    :param _type: Required. Constant filled by server.
    :type _type: str
    :ivar id: A String identifier.
    :vartype id: str
    :ivar web_search_url: The URL To Bing's search result for this item.
    :vartype web_search_url: str
    :ivar query_context: An object that contains the query string that Bing
     used for the request. This object contains the query string as entered by
     the user. It may also contain an altered query string that Bing used for
     the query if the query string contained a spelling mistake.
    :vartype query_context:
     ~azure.cognitiveservices.search.customsearch.models.QueryContext
    :ivar web_pages: A list of webpages that are relevant to the search query.
    :vartype web_pages:
     ~azure.cognitiveservices.search.customsearch.models.WebWebAnswer
    """

    _validation = {
        '_type': {'required': True},
        'id': {'readonly': True},
        'web_search_url': {'readonly': True},
        'query_context': {'readonly': True},
        'web_pages': {'readonly': True},
    }

    _attribute_map = {
        '_type': {'key': '_type', 'type': 'str'},
        'id': {'key': 'id', 'type': 'str'},
        'web_search_url': {'key': 'webSearchUrl', 'type': 'str'},
        'query_context': {'key': 'queryContext', 'type': 'QueryContext'},
        'web_pages': {'key': 'webPages', 'type': 'WebWebAnswer'},
    }

    def __init__(self, **kwargs):
        super(SearchResponse, self).__init__(**kwargs)
        self.query_context = None
        self.web_pages = None
        self._type = 'SearchResponse'
