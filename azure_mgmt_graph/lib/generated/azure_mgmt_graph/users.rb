# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  #
  # The Graph RBAC Management Client
  #
  class Users
    include Azure::ARM::Graph::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the Users class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the GraphRbacManagementClient
    attr_reader :client

    #
    # Create a new user. Reference:
    # https://msdn.microsoft.com/library/azure/ad/graph/api/users-operations#CreateUser
    #
    # @param parameters [UserCreateParameters] Parameters to create a user.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [User] operation results.
    #
    def create(parameters, custom_headers = nil)
      response = create_async(parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Create a new user. Reference:
    # https://msdn.microsoft.com/library/azure/ad/graph/api/users-operations#CreateUser
    #
    # @param parameters [UserCreateParameters] Parameters to create a user.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def create_with_http_info(parameters, custom_headers = nil)
      create_async(parameters, custom_headers).value!
    end

    #
    # Create a new user. Reference:
    # https://msdn.microsoft.com/library/azure/ad/graph/api/users-operations#CreateUser
    #
    # @param parameters [UserCreateParameters] Parameters to create a user.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def create_async(parameters, custom_headers = nil)
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = UserCreateParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/users'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 201
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 201
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = User.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets list of users for the current tenant. Reference
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetUsers
    #
    # @param filter [String] The filter to apply on the operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [UserListResult] operation results.
    #
    def list(filter = nil, custom_headers = nil)
      response = list_async(filter, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets list of users for the current tenant. Reference
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetUsers
    #
    # @param filter [String] The filter to apply on the operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_with_http_info(filter = nil, custom_headers = nil)
      list_async(filter, custom_headers).value!
    end

    #
    # Gets list of users for the current tenant. Reference
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetUsers
    #
    # @param filter [String] The filter to apply on the operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_async(filter = nil, custom_headers = nil)
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/users'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          query_params: {'$filter' => filter,'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = UserListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets user information from the directory. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetAUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [User] operation results.
    #
    def get(upn_or_object_id, custom_headers = nil)
      response = get_async(upn_or_object_id, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets user information from the directory. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetAUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_with_http_info(upn_or_object_id, custom_headers = nil)
      get_async(upn_or_object_id, custom_headers).value!
    end

    #
    # Gets user information from the directory. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#GetAUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_async(upn_or_object_id, custom_headers = nil)
      fail ArgumentError, 'upn_or_object_id is nil' if upn_or_object_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/users/{upnOrObjectId}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'upnOrObjectId' => upn_or_object_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = User.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Updates an exisitng user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#UpdateUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param parameters [UserUpdateParameters] Parameters to update an exisitng
    # user.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def update(upn_or_object_id, parameters, custom_headers = nil)
      response = update_async(upn_or_object_id, parameters, custom_headers).value!
      nil
    end

    #
    # Updates an exisitng user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#UpdateUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param parameters [UserUpdateParameters] Parameters to update an exisitng
    # user.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def update_with_http_info(upn_or_object_id, parameters, custom_headers = nil)
      update_async(upn_or_object_id, parameters, custom_headers).value!
    end

    #
    # Updates an exisitng user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#UpdateUser
    #
    # @param upn_or_object_id [String] User object Id or user principal name to
    # get user information.
    # @param parameters [UserUpdateParameters] Parameters to update an exisitng
    # user.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def update_async(upn_or_object_id, parameters, custom_headers = nil)
      fail ArgumentError, 'upn_or_object_id is nil' if upn_or_object_id.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = UserUpdateParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/users/{upnOrObjectId}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'upnOrObjectId' => upn_or_object_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :patch, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Delete a user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#DeleteUser
    #
    # @param upn_or_object_id [String] user object id or user principal name (upn)
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    #
    def delete(upn_or_object_id, custom_headers = nil)
      response = delete_async(upn_or_object_id, custom_headers).value!
      nil
    end

    #
    # Delete a user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#DeleteUser
    #
    # @param upn_or_object_id [String] user object id or user principal name (upn)
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def delete_with_http_info(upn_or_object_id, custom_headers = nil)
      delete_async(upn_or_object_id, custom_headers).value!
    end

    #
    # Delete a user. Reference:
    # https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations#DeleteUser
    #
    # @param upn_or_object_id [String] user object id or user principal name (upn)
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def delete_async(upn_or_object_id, custom_headers = nil)
      fail ArgumentError, 'upn_or_object_id is nil' if upn_or_object_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/users/{upnOrObjectId}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'upnOrObjectId' => upn_or_object_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :delete, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 204
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

    #
    # Gets a collection that contains the Object IDs of the groups of which the
    # user is a member.
    #
    # @param object_id [String] User filtering parameters.
    # @param parameters [UserGetMemberGroupsParameters] User filtering parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [UserGetMemberGroupsResult] operation results.
    #
    def get_member_groups(object_id, parameters, custom_headers = nil)
      response = get_member_groups_async(object_id, parameters, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets a collection that contains the Object IDs of the groups of which the
    # user is a member.
    #
    # @param object_id [String] User filtering parameters.
    # @param parameters [UserGetMemberGroupsParameters] User filtering parameters.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_member_groups_with_http_info(object_id, parameters, custom_headers = nil)
      get_member_groups_async(object_id, parameters, custom_headers).value!
    end

    #
    # Gets a collection that contains the Object IDs of the groups of which the
    # user is a member.
    #
    # @param object_id [String] User filtering parameters.
    # @param parameters [UserGetMemberGroupsParameters] User filtering parameters.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_member_groups_async(object_id, parameters, custom_headers = nil)
      fail ArgumentError, 'object_id is nil' if object_id.nil?
      fail ArgumentError, 'parameters is nil' if parameters.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      request_headers['Content-Type'] = 'application/json; charset=utf-8'

      # Serialize Request
      request_mapper = UserGetMemberGroupsParameters.mapper()
      request_content = @client.serialize(request_mapper,  parameters, 'parameters')
      request_content = request_content != nil ? JSON.generate(request_content, quirks_mode: true) : nil

      path_template = '/{tenantID}/users/{objectId}/getMemberGroups'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'objectId' => object_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = UserGetMemberGroupsResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Gets list of users for the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [UserListResult] operation results.
    #
    def list_next(next_link, custom_headers = nil)
      response = list_next_async(next_link, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Gets list of users for the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def list_next_with_http_info(next_link, custom_headers = nil)
      list_next_async(next_link, custom_headers).value!
    end

    #
    # Gets list of users for the current tenant.
    #
    # @param next_link [String] Next link for list operation.
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def list_next_async(next_link, custom_headers = nil)
      fail ArgumentError, 'next_link is nil' if next_link.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      fail ArgumentError, '@client.tenant_id is nil' if @client.tenant_id.nil?


      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/{tenantID}/{nextLink}'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'tenantID' => @client.tenant_id},
          skip_encoding_path_params: {'nextLink' => next_link},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            result_mapper = UserListResult.mapper()
            result.body = @client.deserialize(result_mapper, parsed_response, 'result.body')
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
