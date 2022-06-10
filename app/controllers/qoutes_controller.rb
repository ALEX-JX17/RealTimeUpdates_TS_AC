class QoutesController < ApplicationController
    before_action :set_qoute, only: [:show, :edit, :update, :destroy]

    def index
        @qoutes = Qoutes.all
    end

    def show
    end

    def new
        @qoute = Qoute.new
    end

    def create
        @qoute = Qoute.new(qoute_params)
        if @qoute.save
            redirect_to qoutes_path, notice: "Qoute was successfully created"
        else
            rednder :new
        end
    end

    def edit
    end

    def update
        if @qoute.update(qoute_params)
            redirect_to qoutes_path, notice: "The qoute was successfully updated"
        else
            render :edit
        end
    end

    def destroy
        @quote.destroy
        redirect_to quotes_path, notice: "Quote was successfully destroyed."
    end

    private

        def set_quote
            @quote = Quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:name)
        end
end
