class Form  < OpenStruct
  attr_accessor :current_step_number

  def self.sem_all_questions 
    form = Form.new
    step = Step.new(:order => 1)
    step.questions = []
    step.questions << Question.new(:type => :first_name, :label => "First Name")
    form.steps = []
    form.steps << step
    step = Step.new(:order => 2)
    step.questions = []
    step.questions << Question.new(:type => :last_name, :label => "Last Name")
    form.steps << step
    form
  end


  def current_step
    steps.detect{|step| step.order == current_step_number}
  end

  def next_step
    steps.detect{|step| step.order == current_step_number+1}
  end

  def last_step?
    current_step_number == steps.count
  end
end

