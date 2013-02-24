require_relative '../../app/haml_view'
require 'nokogiri'
require 'pry'

def xpath_for(parent, *children)
  children.inject("//div[@class='#{parent}']") do |path_so_far, child|
    path_so_far + "/div[@class='#{child}']"
  end
end


describe "HtmlView#render's result" do
  it "is an HTML document" do
    html= HamlView.new({}).render
    html.gsub!(/\s+/, '')
    html.should == '<html><head></head><body></body></html>'
  end
end

describe "An empty contact" do
  before do
    master_document= {contact: {}}
    @doc= Nokogiri::HTML(HamlView.new(master_document).render)
  end
  
  it "exists" do
    contact= @doc.xpath(xpath_for('contact'))
    contact.should have(1).element
  end

  it "has the correct contact name" do
    name= @doc.xpath(xpath_for('contact', 'name'))
    name.should have(0).elements
  end

  it "has the correct contact email" do
    email= @doc.xpath(xpath_for('contact', 'email'))
    email.should have(0).elements
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
    @doc= Nokogiri::HTML(HamlView.new(master_document).render)
  end
  
  it "exists" do
    contact= @doc.xpath(xpath_for('contact'))
    contact.should have(1).element
  end

  it "has the correct contact name" do
    name= @doc.xpath(xpath_for('contact', 'name'))
    name[0].text.strip.should == 'Joe Smith'
  end

  it "has the correct contact email" do
    email= @doc.xpath(xpath_for('contact', 'email'))
    email[0].text.strip.should == 'joe@example.com'
  end
end

def should_have_document_section(master_document, parent_node, child_expectations)
  describe parent_node do
    before do
      @doc= Nokogiri::HTML(HamlView.new(master_document).render)
    end
    
    it "exists" do
      summary= @doc.xpath(xpath_for(parent_node))
      summary.should have(1).element
    end

    child_expectations.each do |child_name, child_expected_value|
      should_have_child(parent_node, child_name.to_s, child_expected_value)
    end
  end
end

def should_have_child(parent_node, child_node, expected_text)
  describe child_node do
    before do
      @header= @doc.xpath(xpath_for(parent_node, child_node))
    end

    it "exists" do
      @header.should have(1).element
    end

    it "has the correct text" do
      @header.text.strip.should == expected_text
    end
  end
end

should_have_document_section({summary: 'I have done lots of stuff.'},
                             'summary',
                             header: 'Summary',
                             text: 'I have done lots of stuff.')

should_have_document_section({education: 'BS from Miskatonic U'},
                             'education',
                             header: 'Education',
                             text: 'BS from Miskatonic U')

describe 'development section' do
  before do
    master_document= {
      development: {
        header: 'Professional Development',
        projects: [
                   'Makes grand pronouncements.',
                   'Fulfills them.'
        ]
      },
    }
    @doc= Nokogiri::HTML(HamlView.new(master_document).render)
  end

  it "exists" do
    development= @doc.xpath(xpath_for('development'))
    development.should have(1).element
  end

  it "has the correct development name" do
    header= @doc.xpath(xpath_for('development', 'header'))
    header[0].text.strip.should == 'Professional Development'
  end

  it "has the development project list" do
    list= @doc.xpath(xpath_for('development', 'projects'))
    list.should have(1).element
  end

  describe "the development project list" do
    before do
      @projects= @doc.xpath(xpath_for('development', 'projects', 'project'))
    end

    it "has two projects" do
      @projects.should have(2).elements
    end
    
    it "has the correct text for project 0" do
      @projects[0].text.strip.should == 'Makes grand pronouncements.'
    end
    
    it "has the correct text for project 1" do
      @projects[1].text.strip.should == 'Fulfills them.'
    end
  end
end

describe 'experience section' do
  before do
    master_document= {
      experience: [
                   {title: 'Bottle Washer',
                     company: 'Yoyodyne, Inc.',
                     dates: '3/10/2000 - 4/10/2000',
                     responsibilities: ['Wash bottles.',
                                        'Clean up broken glass.']},
                   {title: 'Grand Poobah',
                     company: 'Overlord Industries',
                     dates: '1995 - 2000',
                     responsibilities: ['Direct underlings',
                                        'Inspect tropical locations']}]}

    @doc= Nokogiri::HTML(HamlView.new(master_document).render)
  end

  it "exists" do
    experience= @doc.xpath(xpath_for('experience'))
    experience.should have(1).element
  end

  it "has two jobs" do
    experience= @doc.xpath(xpath_for('experience', 'job'))
    experience.should have(2).elements
  end

  describe "the first job's responsibilites" do
    it "has the correct responsibilities" do
      jobs= @doc.xpath(xpath_for('experience', 'job'))
      first_job= jobs[0]
      responsibilities= first_job.xpath("div[@class='responsibilities']/div[@class='responsibility']")
      responsibilities.map {|r| r.text.strip}.should == ["Wash bottles.", "Clean up broken glass."]
    end
  end
end
