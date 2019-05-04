module Api
	module V1
    class CollegesController < ApplicationController
     skip_before_action :verify_authenticity_token, only: [:search]

      def index
      	colleges = College.all
      	render json: colleges
      end

      def search
      	colleges = College.where("name LIKE ?", "%#{params[:search_string]}%")
      	render json: colleges
      end

    end
  end
end