class User < ApplicationRecord

  # On user creation, we are going to automatically create a ledger in the database just for them
  after_create :create_master_ledger_for_user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ledgers

  private

  # Create a ledger in the database that's tied to the current user.  This will be their master list.
  def create_master_ledger_for_user
    Ledger.create(title: 'My List', user_id: self.id)
  end
end
