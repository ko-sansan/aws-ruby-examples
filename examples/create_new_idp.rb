# frozen_string_literal: true

require 'dotenv/load'
require '../lib/aws_lib_examples'

metadata_file = File.read('metadata.xml')
cognito = CoginitoWrapper.new(ENV['AWS_PROFILE'])
cognito.create_new_idp(ENV['USER_POOL_ID'], 'new-idp-example', { 'MetadataFile': metadata_file })
