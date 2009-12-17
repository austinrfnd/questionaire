# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kim_session',
  :secret      => 'bb861e7b9cbdc5e469b148ec60a1004fd1da4d952c6cba9469eed3e436f2041801bb2f503ea2bfc060a6268b797faaf5e247035420cafd07b7755df6b5c67602'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
