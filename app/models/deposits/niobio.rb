module Deposits
  class Niobio < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable
  end
end
