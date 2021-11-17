require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :rack_file

require 'pry'; binding.pry



# s3_options = {
#   bucket:            "<YOUR BUCKET>", # required
#   region:            "<YOUR REGION>", # required
#   access_key_id:     "<YOUR ACCESS KEY ID>",
#   secret_access_key: "<YOUR SECRET ACCESS KEY>",
# }

# Shrine.storages = {
#   cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary
#   store: Shrine::Storage::S3.new(**s3_options),                  # permanent
# }