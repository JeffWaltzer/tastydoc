class UserDocuments
  def initialize(name)
    @name= name
  end

  def pull_documents
    default_documents = USER_DOCUMENTS[:defaults]
    user_documents = USER_DOCUMENTS[@name.to_sym]
    return default_documents.merge(user_documents)
  end
end
