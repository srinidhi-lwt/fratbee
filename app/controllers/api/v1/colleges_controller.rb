module Api
	module V1
    class CollegesController < ApplicationController

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