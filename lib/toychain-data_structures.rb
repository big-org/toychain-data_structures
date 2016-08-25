%w[
  block
  hasher
  message
  record
  record_list
  serializer
  version
  message_pool
].each { |file| require_relative "./toychain-data_structures/#{file}.rb" }
