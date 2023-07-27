require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    bio: Field::Text,
    birthday: Field::Date,
    boards: Field::HasMany,
    categories: Field::HasMany,
    confirmation_sent_at: Field::DateTime,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    current_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    failed_attempts: Field::Number,
    invite_code: Field::String,
    is_admin: Field::Boolean,
    last_sign_in_at: Field::DateTime,
    last_sign_in_ip: Field::String,
    locked_at: Field::DateTime,
    name: Field::String,
    notes: Field::HasMany,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    sign_in_count: Field::Number,
    unconfirmed_email: Field::String,
    unlock_token: Field::String,
    username: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    bio
    birthday
    boards
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    bio
    birthday
    boards
    categories
    confirmation_sent_at
    confirmation_token
    confirmed_at
    current_sign_in_at
    current_sign_in_ip
    email
    encrypted_password
    failed_attempts
    invite_code
    is_admin
    last_sign_in_at
    last_sign_in_ip
    locked_at
    name
    notes
    remember_created_at
    reset_password_sent_at
    reset_password_token
    sign_in_count
    unconfirmed_email
    unlock_token
    username
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    bio
    birthday
    boards
    categories
    confirmation_sent_at
    confirmation_token
    confirmed_at
    current_sign_in_at
    current_sign_in_ip
    email
    encrypted_password
    failed_attempts
    invite_code
    is_admin
    last_sign_in_at
    last_sign_in_ip
    locked_at
    name
    notes
    remember_created_at
    reset_password_sent_at
    reset_password_token
    sign_in_count
    unconfirmed_email
    unlock_token
    username
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
