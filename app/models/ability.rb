class Ability
  include CanCan::Ability

  def initialize(user)

    # if user.admin?
    #   can :manage, :all
    # elsif user.owner?
    #   can :read, Company
    #   can :create, Company
    #   can :update, Company do |company|
    #     company.try(:user) == user
    #   end
    #   can :destroy, Company do |company|
    #     Company.try(:user) == user
    #   end
    # elsif user.regular?
    #   can :read, Company
    # end

    if user.admin?
      can :manage, :all
    end

    if user.owner?
      
     can :read, Company
     can :create, Company
     can :update, Company do |company|
       company.try(:user) == user
     end
     can :destroy, Company do |company|
       Company.try(:user) == user
     end 

     can :read, Job
     can :create, Job
     can :update, Job do |job|
       job.try(:user) == user
     end
     can :destroy, Job do |job|
       Job.try(:user) == user
     end 

    end

  end
end
