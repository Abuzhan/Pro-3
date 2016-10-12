class UserPolicy < ApplicationPolicy
	def show?
		return true
	end

	def create?
		return true
	end

	def update?
		return true if user.admin?
		return true if record.id == user.id
	end

	def destroy?
		return false
	end

	class Scope < ApplicationPolicy::Scope
		def resolve
			scope.all
		end
	end
end