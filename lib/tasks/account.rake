namespace :account do
  desc "add new account to old members according new currency"
  task :add_new_account_according_new_currency, [:ids] => :environment do
    Member.find_each do |m|
      less = Currency.codes - m.accounts.map(&:currency).map(&:to_sym)
      less.each do |code|
        m.accounts.create(currency: code, balance: 0, locked: 0)
      end
    end
  end
end
