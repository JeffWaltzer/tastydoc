require_relative '../../app/text_view'


describe "TextView#render's result" do
  it "is a text document" do
    text= TextView.new({}).render
    text.should == ''
  end
end

describe "A populated contact" do
  before do
    master_document= {
      contact: {
        name: "Joe Smith",
        email: 'joe@example.com'
      }
    }
    @doc= TextView.new(master_document).render.split("\n")
  end

  it "exists" do
    @doc.size.should == 2
  end

  it "has the correct contact name" do
    name= @doc.first
    name.strip.should == 'Joe Smith'
  end

  it "has the correct contact email" do
    email= @doc[1]
    email.strip.should == 'joe@example.com'
  end
end


describe "experience" do
  before do
    master_document= {
      experience: {
        header: 'Experience' ,
        jobs: [
          {
            title: 'A job',
            company: 'Some Corp Inc.',
            dates: '1990-2009',
            responsibilities: %w{one two three}
          }
        ]
      }
    }
    @doc= TextView.new(master_document).render.split("\n")
  end

  it "exists" do
    puts @doc.inspect
    @doc.size.should == 6
  end

  it 'should have experience' do
    @doc[0].should=='Experience'
  end

  it do
    @doc[1].should == '  A job'
  end

  it "should have company and date" do
    @doc[2].should == "  Some Corp Inc.  1990-2009"
  end
end










#
#def should_have_document_section(master_document, parent_node, child_expectations)
#  describe parent_node do
#    before do
#      @doc= TextView.new(master_document).render
#    end
#
#    child_expectations.each do |child_name, child_expected_value|
#      should_have_child(parent_node, child_name.to_s, child_expected_value)
#    end
#  end
#end
#
#def should_have_child(parent_node, child_node, expected_text)
#  describe child_node do
#    before do
#      @header= @doc.xpath(xpath_for(parent_node, child_node))
#    end
#
#    it "exists" do
#      @header.should have(1).element
#    end
#
#    it "has the correct text" do
#      @header.text.strip.should == expected_text
#    end
#  end
#end
#
#should_have_document_section({summary: {header: 'Summary', text: 'I have done lots of stuff.'}},
#                             'summary',
#                             header: 'Summary',
#                             text: 'I have done lots of stuff.')

#should_have_document_section({education: {header: 'Education', text: 'BS from Miskatonic U'}},
#                             'education',
#                             header: 'Education',
#                             text: 'BS from Miskatonic U')
#
#describe 'development section' do
#  before do
#    master_document= {
#      development: {
#        header: 'Professional Development',
#        projects: [
#                   'Makes grand pronouncements.',
#                   'Fulfills them.'
#        ]
#      },
#    }
#    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
#  end
#
#  it "exists" do
#    development= @doc.xpath(xpath_for('development'))
#    development.should have(1).element
#  end
#
#  it "has the correct development name" do
#    header= @doc.xpath(xpath_for('development', 'header'))
#    header[0].text.strip.should == 'Professional Development'
#  end
#
#  it "has the development project list" do
#    list= @doc.xpath(xpath_for('development', 'projects'))
#    list.should have(1).element
#  end
#
#  describe "the development project list" do
#    before do
#      @projects= @doc.xpath(xpath_for('development', 'projects', 'project'))
#    end
#
#    it "has two projects" do
#      @projects.should have(2).elements
#    end
#
#    it "has the correct text for project 0" do
#      @projects[0].text.strip.should == 'Makes grand pronouncements.'
#    end
#
#    it "has the correct text for project 1" do
#      @projects[1].text.strip.should == 'Fulfills them.'
#    end
#  end
#end
#
#describe 'responsibilities under jobs' do
#  before do
#    master_document= {
#      experience: {
#        jobs: [
#                   {responsibilities: ['Wash bottles.',
#                                       'Clean up broken glass.']},
#                   {responsibilities: ['Direct underlings',
#                                       'Inspect tropical locations']}]}}
#
#    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
#  end
#
#  it "exists" do
#    experience= @doc.xpath(xpath_for('jobs'))
#    experience.should have(1).element
#  end
#
#  it "has two jobs" do
#    jobs= @doc.xpath(xpath_for('jobs', 'job'))
#    jobs.should have(2).elements
#  end
#
#  describe "the first job's responsibilites" do
#    it "has the correct responsibilities" do
#      jobs= @doc.xpath(xpath_for('jobs', 'job'))
#      first_job= jobs[0]
#      responsibilities= first_job.xpath("div[@class='responsibilities']/div[@class='responsibility']")
#      responsibilities.map {|r| r.text.strip}.should == ["Wash bottles.", "Clean up broken glass."]
#    end
#  end
#
#  describe "the second job's responsibilites" do
#    it "has the correct responsibilities" do
#      jobs= @doc.xpath(xpath_for('jobs', 'job'))
#      first_job= jobs[1]
#      responsibilities= first_job.xpath("div[@class='responsibilities']/div[@class='responsibility']")
#      responsibilities.map {|r| r.text.strip}.should == ['Direct underlings', 'Inspect tropical locations']
#    end
#  end
#end
#
#describe 'clients under job' do
#  before do
#    master_document= {
#      experience: {
#        jobs: [
#               {clients: [{company: "Bubblegum, Inc."},
#                          {company: "Jawbreakers, Inc."}]},
#              ]}}
#
#    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
#  end
#
#  it "exists" do
#    clients_section= @doc.xpath(xpath_for('job', 'clients'))
#    clients_section.should have(1).element
#  end
#
#  it "has two clients" do
#    clients= @doc.xpath(xpath_for('clients', 'client'))
#    clients.should have(2).elements
#  end
#
#  describe "the first client's company" do
#    it "has the correct title" do
#      clients= @doc.xpath(xpath_for('clients', 'client'))
#      first_client= clients[0]
#      title= first_client.xpath("div[@class='company']").text.strip
#      title.should == 'Bubblegum, Inc.'
#    end
#  end
#end
#
#describe 'projects under job' do
#  before do
#    master_document= {
#      experience: {
#        jobs: [{projects: [{name: "Chew it."},
#                           {name: "Crunch it."}]},
#              ]}}
#
#    @doc= Nokogiri::HTML(HtmlView.new(master_document).render)
#  end
#
#  it "exists" do
#    projects_section= @doc.xpath(xpath_for('job', 'projects'))
#    projects_section.should have(1).element
#  end
#
#  it "has two projects" do
#    projects= @doc.xpath(xpath_for('projects', 'project'))
#    projects.should have(2).elements
#  end
#
#  describe "the first project" do
#    it "has the correct naame" do
#      projects= @doc.xpath(xpath_for('projects', 'project'))
#      first_project= projects[0]
#      name= first_project.xpath("div[@class='name']").text.strip
#      name.should == 'Chew it.'
#    end
#  end
#end
