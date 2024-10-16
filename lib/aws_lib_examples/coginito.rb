# frozen_string_literal: true

require 'aws-sdk-cognitoidentityprovider'

# CoginitoWrapper class
class CoginitoWrapper
  attr_reader :cognito_client

  def initialize(profile)
    @cognito_client = Aws::CognitoIdentityProvider::Client.new(profile: profile)
  end

  def create_new_idp(user_pool_id, provider_name, provider_details = {})
    res = cognito_client.create_identity_provider(
      {
        user_pool_id: user_pool_id,
        provider_name: provider_name,
        provider_type: 'SAML',
        provider_details: provider_details,
        attribute_mapping: {
          'email': 'email'
        }
      }
    )
    puts res
  end
end
