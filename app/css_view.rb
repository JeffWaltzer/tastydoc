class CssView
  SECTION_STYLES= {
    contact: [".contact {text-align: center;}",
              ".contact div {display: block;}"],
    summary: ".summary {margin-top: 0.25cm; margin-left:0.25cm}",
  }

  def initialize(style)
    @results= []
  end

  def render(document)
#return '' if @document.empty?
  <<-CSS
    body {margin-left: 3%; margin-right: 7%; font-size: medium}
    .contact {text-align: center;}
    .contact div {display: block;}
    .summary {margin-top: 0.25cm; margin-left:0.25cm}
    .header {font-family: sans-serif; font-size: large; margin-top: 0.25cm;}
    .text {margin-left: 0.25cm;}
    .development .projects {margin-left: 0.25cm;}
    .development .projects .projects_item {margin-left: 0.5cm; display: list-item; list-style-type: square;}
    .projects_item {margin-left: 0.75cm;}
    .projects_item .name {font-style:italic}
    .client {margin-left: 0.5cm;}
    .client .company {font-style:italic}
    .jobs_item {margin-left: 0.75cm; margin-top: 0.2cm}
    .title {font-weight: bold}
    .company {font-weight: bold; display: inline}
    .client .company {font-weight: normal; font-style: italic; display: inline}
    .dates {display: inline;}
    .responsibilities {margin-left: 0.75cm; }
    .responsibilities_item {display: list-item; list-style-type: circle}
    CSS
#    @results << ["body {margin-left: 3%; margin-right: 7%;}"]
#    document.each do |sub_name, sub_contents|
#      section_style = SECTION_STYLES[sub_name]
#      if section_style
#        @results += [section_style].flatten
#      end
#    end
#    @results.join("\n")
  end
end

