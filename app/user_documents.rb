class UserDocuments
  def initialize(name)
    @name= name
  end

  def pull_documents
    style_sheet= {indented_sections:
                      [:contact, :text,
                       :projects, :jobs, :responsibilities,
                       :clients],
                  bulleted_sections:
                      [:projects, :jobs, :responsibilities,
                       :clients],
                  seperated_sections:
                      [:additional_info, :jobs, :experience,
                       :development, :education, :skills,
                       :summary, :contact],
                  nobreak_sections: [:sitename]}
    resume = USER_DOCUMENTS[@name.to_sym]
    return resume, style_sheet
  end
end