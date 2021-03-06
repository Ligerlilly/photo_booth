class Day < ActiveRecord::Base
  validates :first_name, :last_name, :event, :email, :date_of_event, :telephone, presence: true
  default_scope  { order(created_at: :desc) }


  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "jaysunlane-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: 800,
        item_name: "Save the Day - #{date_of_event}",
        item_number: 1,
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
