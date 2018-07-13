module Admin
  class Ability
    include CanCan::Ability

    def initialize(user)
      return unless user.admin?

      can :read, Order
      can :read, Trade
      can :read, Proof
      can :update, Proof
      can :manage, Document
      can :manage, Member
      can :manage, Ticket
      can :manage, IdDocument
      can :manage, TwoFactor
      can :manage, Announcement

      can :menu, Deposit
      can :manage, ::Deposits::Bank
      can :manage, ::Deposits::Satoshi
      can :manage, ::Deposits::Fermat
      can :manage, ::Deposits::Niobio
      can :manage, ::Deposits::Dashpay
      can :manage, ::Deposits::Ether

      can :menu, Withdraw
      can :manage, ::Withdraws::Bank
      can :manage, ::Withdraws::Satoshi
      can :manage, ::Withdraws::Fermat
      can :manage, ::Withdraws::Niobio
      can :manage, ::Withdraws::Dashpay
      can :manage, ::Withdraws::Ether

    end
  end
end
