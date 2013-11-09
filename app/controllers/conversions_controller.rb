class ConversionsController < ApplicationController

  before_filter :load_form


  def new 
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new
    @answers = []
    params[:answers].each do |answer_params|
      @answers << Answer.new(type: answer_params[1][:key], value: answer_params[1][:value])
    end

    if @form.last_step?
      redirect_to "/conversions/thanks"
    else
      redirect_to new_conversion_path(experience: "simple_test_experience", :step => @form.next_step.order) 
    end
  end

  def thanks

  end

  private

  def load_form
    @form = Form.sem_all_questions
    @step_number = params[:step].to_i
    @form.current_step_number = @step_number.to_i
  end


end
