class Quote < ApplicationRecord
    validates :name, presence: true

    scope :ordered, -> { order(id: :desc) }

    #REDIS SHOULD BE INSTALLED AND RUNNING
    #redis-server

    # This should be executed every time a new quote is inserted into the database.

    # after_create_commit -> { 
    #     broadcast_prepend_to "quotes", 
    #     partial: "quotes/quote", 
    #     locals: { quote: self }, 
    #     target: "quotes" }
    
    #     As we can see above, we specify the target name to be "quotes" thanks to 
    #     the target: "quotes" option. By default, the target option will be equal 
    #     to model_name.plural, which is equal to "quotes" in the context of our 
    #     Quote model. Thanks to this convention, we can remove the target: "quotes" option

    #     There are two other conventions we can use to shorten our code. Under the hood, 
    #     Turbo has a default value for both the partial and the locals option.
        
    #     The partial default value is equal to calling to_partial_path on an instance of 
    #     the model, which by default in Rails for our Quote model is equal to "quotes/quote".
        
    #     The locals default value is equal to { model_name.element.to_sym => self } which, 
    #     in in the context of our Quote model, is equal to { quote: self }.
        
    #     These are precisely the values that we passed as options. Thus, the following 
    #     code is equivalent to what we had before:
    after_create_commit -> { broadcast_prepend_to "quotes" }
    after_update_commit -> { broadcast_replace_to "quotes" }
    after_destroy_commit -> { broadcast_remove_to "quotes" }
end
