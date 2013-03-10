require 'sinatra'
class CssView
  def render
    <<-CSS
      body {margin-left: 3%; margin-right: 7%;}
      .contact {text-align: center;}
      .contact div {display: block;}
      .name {}
      .street {}
      .city_state_zip {}
      .phone {}
      .email {}
      .summary {margin-top: 0.25cm; margin-left:0.25cm}
      .skills {}
      .header {font-family: sans-serif; font-size: large; margin-top: 0.25cm;}
      .text {margin-left: 0.25cm;}
      .education {}
      .development {}
      .development .projects {margin-left: 0.25cm;}
      .development .projects .project {margin-left: 0.5cm; display: list-item; list-style-type: square;}
      .projects {}
      .project {margin-left: 0.75cm;}
      .project .name {font-style:italic}
      .client {margin-left: 0.5cm;}
      .client .company {font-style:italic}
      .experience {}
      .jobs {}
      .job {margin-left: 0.75cm; margin-top: 0.2cm}
      .title {font-weight: bold}
      .company {font-weight: bold; display: inline}
      .client .company {font-weight: normal; font-style: italic; display: inline}
      .dates {display: inline;}
      .responsibilities {margin-left: 0.75cm; }
      .responsibility {display: list-item; list-style-type: circle}
    CSS
  end
end