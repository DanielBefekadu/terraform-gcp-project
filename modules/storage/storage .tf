resource "google_storage_bucket" "tf_bucket" {
    name = "tf_bucket_name"
    location= "US"
    force_destory  = true
    uniform_bucket_level_access= true
}