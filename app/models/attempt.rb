class Attempt < ActiveRecord::Base
  belongs_to :webhook
  belongs_to :post_error
  validate :success_not_nil
  validate :success_without_error
  attr_accessible :success, :error

  def success_without_error
    (@success and not @error) or (@error and not @success)
  end

  def success_not_nil
    !@success.nil?
  end
end
