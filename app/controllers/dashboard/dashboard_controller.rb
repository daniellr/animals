class Dashboard::DashboardController < Dashboard::BaseController

	def index
		@user = User.all
	end
end
