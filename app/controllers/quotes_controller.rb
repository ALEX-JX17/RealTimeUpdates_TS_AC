class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]
    
    def index
        @quotes = Quote.ordered
    end

    def show
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = Quote.new(quote_params)

        respond_to do |format|
            if @quote.save
                # A way to respond is just "format.turbo_stream". This Turbo stream way
                #scope :ordered, -> { order(id: :desc) } will render a view file called create.turbo_stream.erd (in my case is *.slim)
                # where we will instruct Turbo to do two things: append on "quotes" frame and
                # update the "new_quote" frame.
                format.turbo_stream 
                # Or we can directly render the turbo streams like this:
                # format.turbo_stream do
                #     render turbo_stream: [
                #         turbo_stream.update( Quote.new, ""),
                #         turbo_stream.append( 'quotes', partial: "quotes/quote", 
                #                             locals: { quote: @quote } )                       
                #     ]
                # end
                format.html{ redirect_to quotes_path, notice: "Quote was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        if @quote.update(quote_params)
            redirect_to quotes_path, notice: "The quote was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @quote.destroy
        # redirect_to quotes_path, notice: "Quote was successfully destroyed."
        respond_to do |format|
            # format.turbo_stream { render turbo_stream: turbo_stream.remove( @quote ) }
            format.turbo_stream do
                render turbo_stream: [
                    turbo_stream.remove( @quote ),
                    turbo_stream.update( "quotes_count", partial: "quotes/quotes_count" )           
                ]
            end
            format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
        end
    end

    # def close_edit
    #     redirect_to quotes_path
    # end

    private
        def set_quote
            @quote = Quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:name)
        end
        
end
