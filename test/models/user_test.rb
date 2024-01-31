require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(username: 'utente2', is_admin: false, password: 'test_password_utente1')
    assert user.valid?
  end

  test 'invalid without username' do
    user = User.new(is_admin: false, password: 'test_password_utente1')
    refute user.valid?, 'user is valid without username'
  end

  test 'invalid without password' do
    user = User.new(username: 'utente1', is_admin: false)
    refute user.valid?, 'user is valid without password'
  end

  # per come funziona checkbox di rails bisogna guardare
  # come risolvere
  # test 'invalid without is_admin' do
  #   user = User.new(username: 'utente1', password: 'test_password_utente1')
  #   refute user.valid?, 'user is valid without is_admin'
  # end

  test 'invalid if username already taken' do
    user = User.create(username: 'utente1', is_admin: false, password: 'test_password_utente1')
    user_dup = User.create(username: 'utente1', is_admin: true, password: 'test_password_utente1_dup')
    refute user_dup.valid?, 'user is created with same username'
  end
end
