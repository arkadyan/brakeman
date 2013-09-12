class User < ActiveRecord::Base
  attr_accessible :bio, :name, :account_id, :admin, :status_id


  def style_url(*args)
    options = args.pop || {}
    options = validate_options(options)
    "/users/#{id}?style=#{options[:style]}"
  end

  private

  def validate_options options
    VALID_STYLES = %w(light medium dark)
    options.delete(:style) unless VALID_STYLES.include?(options[:style])
    options.reverse_merge(:style => 'dark')
  end
end
