require "cloudinary"
require "shrine/storage/cloudinary"

Cloudinary.config(
    cloud_name: "dsadadsdsd",
    api_key:    "591195129252697",
    api_secret: "56KWNChNJgxLEyBv1X_MSAw8oWc",
)
Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new(prefix: "Open_Shop/cache"), # for direct uploads
    store: Shrine::Storage::Cloudinary.new(prefix: "Open_Shop"),
}
Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
‍