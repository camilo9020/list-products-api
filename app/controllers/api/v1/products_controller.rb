module Api
	module V1
		class ProductsController < ApplicationController
					

			def index
				products = Product.all
				render json: products		

			end

			def show
				respond_with Product.find(params[:id])
			end

			def create
			 	product = Product.new(product_params)

			 	if product.save
			 		render json: product, status: 201, location: [:api, product]
		 		else
		 			render json: {errors: product.errors}, status: 422
			 	end	
			end

			def update
				respond_with Product.updatee(params[:id], params[:product])
			end

			def destroy
				respond_with Product.destroy(params[:id])
			end

			private

			def product_params
				params.require(:product).permit(:name, :price)				
			end




		end

	end	
end


