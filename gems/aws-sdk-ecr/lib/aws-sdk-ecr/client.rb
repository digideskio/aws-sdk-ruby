# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/request_signer.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/protocols/json_rpc.rb'

Aws::Plugins::GlobalConfiguration::IDENTIFIERS << :ecr

module Aws
  module ECR
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :ecr

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::HelpfulSocketErrors)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::JsonRpc)

      # @option options [required, Aws::CredentialProvider] :credentials
      #   Your AWS credentials. This can be an instance of any one of the
      #   following classes:
      #
      #   * `Aws::Credentials` - Used for configuring static, non-refreshing
      #     credentials.
      #
      #   * `Aws::InstanceProfileCredentials` - Used for loading credentials
      #     from an EC2 IMDS on an EC2 instance.
      #
      #   * `Aws::SharedCredentials` - Used for loading credentials from a
      #     shared file, such as `~/.aws/config`.
      #
      #   * `Aws::AssumeRoleCredentials` - Used when you need to assume a role.
      #
      #   When `:credentials` are not configured directly, the following
      #   locations will be searched for credentials:
      #
      #   * `Aws.config[:credentials]`
      #   * The `:access_key_id`, `:secret_access_key`, and `:session_token` options.
      #   * ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      #   * EC2 IMDS instance profile - When used by default, the timeouts are
      #     very aggressive. Construct and pass an instance of
      #     `Aws::InstanceProfileCredentails` to enable retries and extended
      #     timeouts.
      # @option options [required, String] :region
      #   The AWS region to connect to.  The configured `:region` is
      #   used to determine the service `:endpoint`. When not passed,
      #   a default `:region` is search for in the following locations:
      #
      #   * `Aws.config[:region]`
      #   * `ENV['AWS_REGION']`
      #   * `ENV['AMAZON_REGION']`
      #   * `ENV['AWS_DEFAULT_REGION']`
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      # @option options [String] :access_key_id
      # @option options [Boolean] :convert_params (true)
      #   When `true`, an attempt is made to coerce request parameters into
      #   the required types.
      # @option options [String] :endpoint
      #   The client endpoint is normally constructed from the `:region`
      #   option. You should only configure an `:endpoint` when connecting
      #   to test endpoints. This should be avalid HTTP(S) URI.
      # @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
      #   The log formatter.
      # @option options [Symbol] :log_level (:info)
      #   The log level to send messages to the `:logger` at.
      # @option options [Logger] :logger
      #   The Logger instance to send log messages to.  If this option
      #   is not set, logging will be disabled.
      # @option options [String] :profile ("default")
      #   Used when loading credentials from the shared credentials file
      #   at HOME/.aws/credentials.  When not specified, 'default' is used.
      # @option options [Integer] :retry_limit (3)
      #   The maximum number of times to retry failed requests.  Only
      #   ~ 500 level server errors and certain ~ 400 level client errors
      #   are retried.  Generally, these are throttling errors, data
      #   checksum errors, networking errors, timeout errors and auth
      #   errors from expired credentials.
      # @option options [String] :secret_access_key
      # @option options [String] :session_token
      # @option options [Boolean] :simple_json (false)
      #   Disables request parameter conversion, validation, and formatting.
      #   Also disable response data type conversions. This option is useful
      #   when you want to ensure the highest level of performance by
      #   avoiding overhead of walking request parameters and response data
      #   structures.
      #
      #   When `:simple_json` is enabled, the request parameters hash must
      #   be formatted exactly as the DynamoDB API expects.
      # @option options [Boolean] :stub_responses (false)
      #   Causes the client to return stubbed responses. By default
      #   fake responses are generated and returned. You can specify
      #   the response data to return or errors to raise by calling
      #   {ClientStubs#stub_responses}. See {ClientStubs} for more information.
      #
      #   ** Please note ** When response stubbing is enabled, no HTTP
      #   requests are made, and retries are disabled.
      # @option options [Boolean] :validate_params (true)
      #   When `true`, request parameters are validated before
      #   sending the request.
      def initialize(*args)
        super
      end

      # @!group API Operations

      # Check the availability of multiple image layers in a specified
      # registry and repository.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   image layers to check. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository that is associated with the image layers to
      #   check.
      # @option params [required, Array<String>] :layer_digests
      #   The digests of the image layers to check.
      # @return [Types::BatchCheckLayerAvailabilityResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::BatchCheckLayerAvailabilityResponse#layers #layers} => Array&lt;Types::Layer&gt;
      #   * {Types::BatchCheckLayerAvailabilityResponse#failures #failures} => Array&lt;Types::LayerFailure&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.batch_check_layer_availability({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     layer_digests: ["BatchedOperationLayerDigest"], # required
      #   })
      #
      # @example Response structure
      #   resp.layers #=> Array
      #   resp.layers[0].layer_digest #=> String
      #   resp.layers[0].layer_availability #=> String, one of "AVAILABLE", "UNAVAILABLE"
      #   resp.layers[0].layer_size #=> Integer
      #   resp.failures #=> Array
      #   resp.failures[0].layer_digest #=> String
      #   resp.failures[0].failure_code #=> String, one of "InvalidLayerDigest", "MissingLayerDigest"
      #   resp.failures[0].failure_reason #=> String
      # @overload batch_check_layer_availability(params = {})
      # @param [Hash] params ({})
      def batch_check_layer_availability(params = {}, options = {})
        req = build_request(:batch_check_layer_availability, params)
        req.send_request(options)
      end

      # Deletes a list of specified images within a specified repository.
      # Images are specified with either `imageTag` or `imageDigest`.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   image to delete. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The repository that contains the image to delete.
      # @option params [required, Array<Types::ImageIdentifier>] :image_ids
      #   A list of image ID references that correspond to images to delete. The
      #   format of the `imageIds` reference is `imageTag=tag` or
      #   `imageDigest=digest`.
      # @return [Types::BatchDeleteImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::BatchDeleteImageResponse#image_ids #imageIds} => Array&lt;Types::ImageIdentifier&gt;
      #   * {Types::BatchDeleteImageResponse#failures #failures} => Array&lt;Types::ImageFailure&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.batch_delete_image({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     image_ids: [ # required
      #       {
      #         image_digest: "ImageDigest",
      #         image_tag: "ImageTag",
      #       },
      #     ],
      #   })
      #
      # @example Response structure
      #   resp.image_ids #=> Array
      #   resp.image_ids[0].image_digest #=> String
      #   resp.image_ids[0].image_tag #=> String
      #   resp.failures #=> Array
      #   resp.failures[0].image_id.image_digest #=> String
      #   resp.failures[0].image_id.image_tag #=> String
      #   resp.failures[0].failure_code #=> String, one of "InvalidImageDigest", "InvalidImageTag", "ImageTagDoesNotMatchDigest", "ImageNotFound", "MissingDigestAndTag"
      #   resp.failures[0].failure_reason #=> String
      # @overload batch_delete_image(params = {})
      # @param [Hash] params ({})
      def batch_delete_image(params = {}, options = {})
        req = build_request(:batch_delete_image, params)
        req.send_request(options)
      end

      # Gets detailed information for specified images within a specified
      # repository. Images are specified with either `imageTag` or
      # `imageDigest`.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   images to describe. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The repository that contains the images to describe.
      # @option params [required, Array<Types::ImageIdentifier>] :image_ids
      #   A list of image ID references that correspond to images to describe.
      #   The format of the `imageIds` reference is `imageTag=tag` or
      #   `imageDigest=digest`.
      # @return [Types::BatchGetImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::BatchGetImageResponse#images #images} => Array&lt;Types::Image&gt;
      #   * {Types::BatchGetImageResponse#failures #failures} => Array&lt;Types::ImageFailure&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.batch_get_image({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     image_ids: [ # required
      #       {
      #         image_digest: "ImageDigest",
      #         image_tag: "ImageTag",
      #       },
      #     ],
      #   })
      #
      # @example Response structure
      #   resp.images #=> Array
      #   resp.images[0].registry_id #=> String
      #   resp.images[0].repository_name #=> String
      #   resp.images[0].image_id.image_digest #=> String
      #   resp.images[0].image_id.image_tag #=> String
      #   resp.images[0].image_manifest #=> String
      #   resp.failures #=> Array
      #   resp.failures[0].image_id.image_digest #=> String
      #   resp.failures[0].image_id.image_tag #=> String
      #   resp.failures[0].failure_code #=> String, one of "InvalidImageDigest", "InvalidImageTag", "ImageTagDoesNotMatchDigest", "ImageNotFound", "MissingDigestAndTag"
      #   resp.failures[0].failure_reason #=> String
      # @overload batch_get_image(params = {})
      # @param [Hash] params ({})
      def batch_get_image(params = {}, options = {})
        req = build_request(:batch_get_image, params)
        req.send_request(options)
      end

      # Inform Amazon ECR that the image layer upload for a specified
      # registry, repository name, and upload ID, has completed. You can
      # optionally provide a `sha256` digest of the image layer for data
      # validation purposes.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry to which to upload
      #   layers. If you do not specify a registry, the default registry is
      #   assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository to associate with the image layer.
      # @option params [required, String] :upload_id
      #   The upload ID from a previous InitiateLayerUpload operation to
      #   associate with the image layer.
      # @option params [required, Array<String>] :layer_digests
      #   The `sha256` digest of the image layer.
      # @return [Types::CompleteLayerUploadResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CompleteLayerUploadResponse#registry_id #registryId} => String
      #   * {Types::CompleteLayerUploadResponse#repository_name #repositoryName} => String
      #   * {Types::CompleteLayerUploadResponse#upload_id #uploadId} => String
      #   * {Types::CompleteLayerUploadResponse#layer_digest #layerDigest} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.complete_layer_upload({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     upload_id: "UploadId", # required
      #     layer_digests: ["LayerDigest"], # required
      #   })
      #
      # @example Response structure
      #   resp.registry_id #=> String
      #   resp.repository_name #=> String
      #   resp.upload_id #=> String
      #   resp.layer_digest #=> String
      # @overload complete_layer_upload(params = {})
      # @param [Hash] params ({})
      def complete_layer_upload(params = {}, options = {})
        req = build_request(:complete_layer_upload, params)
        req.send_request(options)
      end

      # Creates an image repository.
      # @option params [required, String] :repository_name
      #   The name to use for the repository. The repository name may be
      #   specified on its own (such as `nginx-web-app`) or it can be prepended
      #   with a namespace to group the repository into a category (such as
      #   `project-a/nginx-web-app`).
      # @return [Types::CreateRepositoryResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateRepositoryResponse#repository #repository} => Types::Repository
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_repository({
      #     repository_name: "RepositoryName", # required
      #   })
      #
      # @example Response structure
      #   resp.repository.repository_arn #=> String
      #   resp.repository.registry_id #=> String
      #   resp.repository.repository_name #=> String
      #   resp.repository.repository_uri #=> String
      # @overload create_repository(params = {})
      # @param [Hash] params ({})
      def create_repository(params = {}, options = {})
        req = build_request(:create_repository, params)
        req.send_request(options)
      end

      # Deletes an existing image repository. If a repository contains images,
      # you must use the `force` option to delete it.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository to delete. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository to delete.
      # @option params [Boolean] :force
      #   Force the deletion of the repository if it contains images.
      # @return [Types::DeleteRepositoryResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DeleteRepositoryResponse#repository #repository} => Types::Repository
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_repository({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     force: false,
      #   })
      #
      # @example Response structure
      #   resp.repository.repository_arn #=> String
      #   resp.repository.registry_id #=> String
      #   resp.repository.repository_name #=> String
      #   resp.repository.repository_uri #=> String
      # @overload delete_repository(params = {})
      # @param [Hash] params ({})
      def delete_repository(params = {}, options = {})
        req = build_request(:delete_repository, params)
        req.send_request(options)
      end

      # Deletes the repository policy from a specified repository.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository policy to delete. If you do not specify a registry, the
      #   default registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository that is associated with the repository
      #   policy to delete.
      # @return [Types::DeleteRepositoryPolicyResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DeleteRepositoryPolicyResponse#registry_id #registryId} => String
      #   * {Types::DeleteRepositoryPolicyResponse#repository_name #repositoryName} => String
      #   * {Types::DeleteRepositoryPolicyResponse#policy_text #policyText} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_repository_policy({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #   })
      #
      # @example Response structure
      #   resp.registry_id #=> String
      #   resp.repository_name #=> String
      #   resp.policy_text #=> String
      # @overload delete_repository_policy(params = {})
      # @param [Hash] params ({})
      def delete_repository_policy(params = {}, options = {})
        req = build_request(:delete_repository_policy, params)
        req.send_request(options)
      end

      # Describes image repositories in a registry.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repositories to be described. If you do not specify a registry, the
      #   default registry is assumed.
      # @option params [Array<String>] :repository_names
      #   A list of repositories to describe. If this parameter is omitted, then
      #   all repositories in a registry are described.
      # @option params [String] :next_token
      #   The `nextToken` value returned from a previous paginated
      #   `DescribeRepositories` request where `maxResults` was used and the
      #   results exceeded the value of that parameter. Pagination continues
      #   from the end of the previous results that returned the `nextToken`
      #   value. This value is `null` when there are no more results to return.
      #
      #   <note markdown="1"> This token should be treated as an opaque identifier that is only used
      #   to retrieve the next items in a list and not for other programmatic
      #   purposes.
      #
      #    </note>
      # @option params [Integer] :max_results
      #   The maximum number of repository results returned by
      #   `DescribeRepositories` in paginated output. When this parameter is
      #   used, `DescribeRepositories` only returns `maxResults` results in a
      #   single page along with a `nextToken` response element. The remaining
      #   results of the initial request can be seen by sending another
      #   `DescribeRepositories` request with the returned `nextToken` value.
      #   This value can be between 1 and 100. If this parameter is not used,
      #   then `DescribeRepositories` returns up to 100 results and a
      #   `nextToken` value, if applicable.
      # @return [Types::DescribeRepositoriesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeRepositoriesResponse#repositories #repositories} => Array&lt;Types::Repository&gt;
      #   * {Types::DescribeRepositoriesResponse#next_token #nextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_repositories({
      #     registry_id: "RegistryId",
      #     repository_names: ["RepositoryName"],
      #     next_token: "NextToken",
      #     max_results: 1,
      #   })
      #
      # @example Response structure
      #   resp.repositories #=> Array
      #   resp.repositories[0].repository_arn #=> String
      #   resp.repositories[0].registry_id #=> String
      #   resp.repositories[0].repository_name #=> String
      #   resp.repositories[0].repository_uri #=> String
      #   resp.next_token #=> String
      # @overload describe_repositories(params = {})
      # @param [Hash] params ({})
      def describe_repositories(params = {}, options = {})
        req = build_request(:describe_repositories, params)
        req.send_request(options)
      end

      # Retrieves a token that is valid for a specified registry for 12 hours.
      # This command allows you to use the `docker` CLI to push and pull
      # images with Amazon ECR. If you do not specify a registry, the default
      # registry is assumed.
      #
      # The `authorizationToken` returned for each registry specified is a
      # base64 encoded string that can be decoded and used in a `docker login`
      # command to authenticate to a registry. The AWS CLI offers an `aws ecr
      # get-login` command that simplifies the login process.
      # @option params [Array<String>] :registry_ids
      #   A list of AWS account IDs that are associated with the registries for
      #   which to get authorization tokens. If you do not specify a registry,
      #   the default registry is assumed.
      # @return [Types::GetAuthorizationTokenResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetAuthorizationTokenResponse#authorization_data #authorizationData} => Array&lt;Types::AuthorizationData&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_authorization_token({
      #     registry_ids: ["RegistryId"],
      #   })
      #
      # @example Response structure
      #   resp.authorization_data #=> Array
      #   resp.authorization_data[0].authorization_token #=> String
      #   resp.authorization_data[0].expires_at #=> Time
      #   resp.authorization_data[0].proxy_endpoint #=> String
      # @overload get_authorization_token(params = {})
      # @param [Hash] params ({})
      def get_authorization_token(params = {}, options = {})
        req = build_request(:get_authorization_token, params)
        req.send_request(options)
      end

      # Retrieves the pre-signed Amazon S3 download URL corresponding to an
      # image layer. You can only get URLs for image layers that are
      # referenced in an image.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   image layer to download. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository that is associated with the image layer to
      #   download.
      # @option params [required, String] :layer_digest
      #   The digest of the image layer to download.
      # @return [Types::GetDownloadUrlForLayerResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetDownloadUrlForLayerResponse#download_url #downloadUrl} => String
      #   * {Types::GetDownloadUrlForLayerResponse#layer_digest #layerDigest} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_download_url_for_layer({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     layer_digest: "LayerDigest", # required
      #   })
      #
      # @example Response structure
      #   resp.download_url #=> String
      #   resp.layer_digest #=> String
      # @overload get_download_url_for_layer(params = {})
      # @param [Hash] params ({})
      def get_download_url_for_layer(params = {}, options = {})
        req = build_request(:get_download_url_for_layer, params)
        req.send_request(options)
      end

      # Retrieves the repository policy for a specified repository.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository. If you do not specify a registry, the default registry is
      #   assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository whose policy you want to retrieve.
      # @return [Types::GetRepositoryPolicyResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetRepositoryPolicyResponse#registry_id #registryId} => String
      #   * {Types::GetRepositoryPolicyResponse#repository_name #repositoryName} => String
      #   * {Types::GetRepositoryPolicyResponse#policy_text #policyText} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_repository_policy({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #   })
      #
      # @example Response structure
      #   resp.registry_id #=> String
      #   resp.repository_name #=> String
      #   resp.policy_text #=> String
      # @overload get_repository_policy(params = {})
      # @param [Hash] params ({})
      def get_repository_policy(params = {}, options = {})
        req = build_request(:get_repository_policy, params)
        req.send_request(options)
      end

      # Notify Amazon ECR that you intend to upload an image layer.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that you intend to
      #   upload layers to. If you do not specify a registry, the default
      #   registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository that you intend to upload layers to.
      # @return [Types::InitiateLayerUploadResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::InitiateLayerUploadResponse#upload_id #uploadId} => String
      #   * {Types::InitiateLayerUploadResponse#part_size #partSize} => Integer
      #
      # @example Request syntax with placeholder values
      #   resp = client.initiate_layer_upload({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #   })
      #
      # @example Response structure
      #   resp.upload_id #=> String
      #   resp.part_size #=> Integer
      # @overload initiate_layer_upload(params = {})
      # @param [Hash] params ({})
      def initiate_layer_upload(params = {}, options = {})
        req = build_request(:initiate_layer_upload, params)
        req.send_request(options)
      end

      # Lists all the image IDs for a given repository.
      #
      # You can filter images based on whether or not they are tagged by
      # setting the `tagStatus` parameter to `TAGGED` or `UNTAGGED`. For
      # example, you can filter your results to return only `UNTAGGED` images
      # and then pipe that result to a BatchDeleteImage operation to delete
      # them. Or, you can filter your results to return only `TAGGED` images
      # to list all of the tags in your repository.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository to list images in. If you do not specify a registry, the
      #   default registry is assumed.
      # @option params [required, String] :repository_name
      #   The repository whose image IDs are to be listed.
      # @option params [String] :next_token
      #   The `nextToken` value returned from a previous paginated `ListImages`
      #   request where `maxResults` was used and the results exceeded the value
      #   of that parameter. Pagination continues from the end of the previous
      #   results that returned the `nextToken` value. This value is `null` when
      #   there are no more results to return.
      #
      #   <note markdown="1"> This token should be treated as an opaque identifier that is only used
      #   to retrieve the next items in a list and not for other programmatic
      #   purposes.
      #
      #    </note>
      # @option params [Integer] :max_results
      #   The maximum number of image results returned by `ListImages` in
      #   paginated output. When this parameter is used, `ListImages` only
      #   returns `maxResults` results in a single page along with a `nextToken`
      #   response element. The remaining results of the initial request can be
      #   seen by sending another `ListImages` request with the returned
      #   `nextToken` value. This value can be between 1 and 100. If this
      #   parameter is not used, then `ListImages` returns up to 100 results and
      #   a `nextToken` value, if applicable.
      # @option params [Types::ListImagesFilter] :filter
      #   The filter key and value with which to filter your `ListImages`
      #   results.
      # @return [Types::ListImagesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListImagesResponse#image_ids #imageIds} => Array&lt;Types::ImageIdentifier&gt;
      #   * {Types::ListImagesResponse#next_token #nextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_images({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     next_token: "NextToken",
      #     max_results: 1,
      #     filter: {
      #       tag_status: "TAGGED", # accepts TAGGED, UNTAGGED
      #     },
      #   })
      #
      # @example Response structure
      #   resp.image_ids #=> Array
      #   resp.image_ids[0].image_digest #=> String
      #   resp.image_ids[0].image_tag #=> String
      #   resp.next_token #=> String
      # @overload list_images(params = {})
      # @param [Hash] params ({})
      def list_images(params = {}, options = {})
        req = build_request(:list_images, params)
        req.send_request(options)
      end

      # Creates or updates the image manifest associated with an image.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository in which to put the image. If you do not specify a
      #   registry, the default registry is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository in which to put the image.
      # @option params [required, String] :image_manifest
      #   The image manifest corresponding to the image to be uploaded.
      # @return [Types::PutImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::PutImageResponse#image #image} => Types::Image
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_image({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     image_manifest: "ImageManifest", # required
      #   })
      #
      # @example Response structure
      #   resp.image.registry_id #=> String
      #   resp.image.repository_name #=> String
      #   resp.image.image_id.image_digest #=> String
      #   resp.image.image_id.image_tag #=> String
      #   resp.image.image_manifest #=> String
      # @overload put_image(params = {})
      # @param [Hash] params ({})
      def put_image(params = {}, options = {})
        req = build_request(:put_image, params)
        req.send_request(options)
      end

      # Applies a repository policy on a specified repository to control
      # access permissions.
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that contains the
      #   repository. If you do not specify a registry, the default registry is
      #   assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository to receive the policy.
      # @option params [required, String] :policy_text
      #   The JSON repository policy text to apply to the repository.
      # @option params [Boolean] :force
      #   If the policy you are attempting to set on a repository policy would
      #   prevent you from setting another policy in the future, you must force
      #   the SetRepositoryPolicy operation. This is intended to prevent
      #   accidental repository lock outs.
      # @return [Types::SetRepositoryPolicyResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::SetRepositoryPolicyResponse#registry_id #registryId} => String
      #   * {Types::SetRepositoryPolicyResponse#repository_name #repositoryName} => String
      #   * {Types::SetRepositoryPolicyResponse#policy_text #policyText} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_repository_policy({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     policy_text: "RepositoryPolicyText", # required
      #     force: false,
      #   })
      #
      # @example Response structure
      #   resp.registry_id #=> String
      #   resp.repository_name #=> String
      #   resp.policy_text #=> String
      # @overload set_repository_policy(params = {})
      # @param [Hash] params ({})
      def set_repository_policy(params = {}, options = {})
        req = build_request(:set_repository_policy, params)
        req.send_request(options)
      end

      # Uploads an image layer part to Amazon ECR.
      #
      # <note markdown="1"> This operation is used by the Amazon ECR proxy, and it is not intended
      # for general use by customers. Use the `docker` CLI to pull, tag, and
      # push images.
      #
      #  </note>
      # @option params [String] :registry_id
      #   The AWS account ID associated with the registry that you are uploading
      #   layer parts to. If you do not specify a registry, the default registry
      #   is assumed.
      # @option params [required, String] :repository_name
      #   The name of the repository that you are uploading layer parts to.
      # @option params [required, String] :upload_id
      #   The upload ID from a previous InitiateLayerUpload operation to
      #   associate with the layer part upload.
      # @option params [required, Integer] :part_first_byte
      #   The integer value of the first byte of the layer part.
      # @option params [required, Integer] :part_last_byte
      #   The integer value of the last byte of the layer part.
      # @option params [required, String, IO] :layer_part_blob
      #   The base64-encoded layer part payload.
      # @return [Types::UploadLayerPartResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UploadLayerPartResponse#registry_id #registryId} => String
      #   * {Types::UploadLayerPartResponse#repository_name #repositoryName} => String
      #   * {Types::UploadLayerPartResponse#upload_id #uploadId} => String
      #   * {Types::UploadLayerPartResponse#last_byte_received #lastByteReceived} => Integer
      #
      # @example Request syntax with placeholder values
      #   resp = client.upload_layer_part({
      #     registry_id: "RegistryId",
      #     repository_name: "RepositoryName", # required
      #     upload_id: "UploadId", # required
      #     part_first_byte: 1, # required
      #     part_last_byte: 1, # required
      #     layer_part_blob: "data", # required
      #   })
      #
      # @example Response structure
      #   resp.registry_id #=> String
      #   resp.repository_name #=> String
      #   resp.upload_id #=> String
      #   resp.last_byte_received #=> Integer
      # @overload upload_layer_part(params = {})
      # @param [Hash] params ({})
      def upload_layer_part(params = {}, options = {})
        req = build_request(:upload_layer_part, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {}
      end

      # @api private
      class << self

        # @api private
        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end