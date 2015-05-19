module ClassListsHelper

  # returns application status
  def application_status(class_list)
    if class_list.paid && class_list.waiver
      'Application Status: Finished'
    else
      'Application Status: Spot Reserved. Please complete payment and sign waiver to finish your application'
    end
  end

end
