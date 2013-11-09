class TargetsController < ApplicationController

  # arrival source id 
  def asid
    experience = choose_experience(nil)
    arrival = Arrival.create!(experience: experience)
    session[:arrival_id] = arrival.id
    redirect_to new_conversion_path(experience: "simple_test_experience", :step => 1)
  end

  def preview 
    experience = Experience.find_or_create_by_name(params[:id])
    source = Source.find_or_create_by_name("test", type: "test")
    arrival_source = ArrivalSource.find_or_create_by_name("Test", :source => source)
    redirect_to_experience(experience, arrival_source)
  end

  private

  def choose_experience(arrival_source)
    total_weight = 0
    splits = arrival_source.splits
    splits.each do |split|
      total_weight = total_weight + split.weight
    end

    random = Random.rand(total_weight)

    total = 0 
    chosen_experience = nil
    splits.each do |split|
      total = total + split.weight
      if random <= total 
        chosen_experience = split.experience
      end
    end
    chosen_experience
  end
end
