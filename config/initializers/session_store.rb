# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jerrymagazine_session',
  :secret      => '06d2399ff421c34785a1861725b3b0ec0f490518d61dd19c8f704a92d5b1fb26c74072e4659a95f705d8b6fd96e8176947d5349c048515ff663f2d22baea289a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
