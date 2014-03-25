class CssView
  def initialize(style)
    @results= []
  end

  def render(document)
  <<-CSS
  body {
      margin-left: 3%;
      margin-right: 7%;
      font-size: medium;
      font-family: sans-serif;
  }

  .contact {
      text-align: center;
  }

  .contact div {
      display: block;
  }

  .summary {
      margin-top: 0.25cm;
      margin-left: 0.25cm
  }

  .header {
      font-size: large;
      margin-top: 0.25cm;
  }

  .text {
      margin-left: 0.25cm;
  }

  .website {
      margin-left: 0.25cm;
  }

  .development .projects {
      margin-left: 0.5cm;
      display: list-item;
      list-style-type: square;
  }

  .projects .name {
      margin-left: 0.250cm;
      font-style: italic;
  }

  .client {
      margin-left: 0.5cm;
  }

  .client .company {
      font-style: italic
  }

  .jobs {
    page-break-inside: avoid;
  }
  .jobs_item {
      margin-left: 0.75cm;
      margin-top: 0.1cm
  }

  .title {
      padding-top: 0.20cm;
      font-weight: bold
  }

  .company {
      font-weight: bold;
      display: inline
  }

  .client .company {
      font-weight: normal;
      font-style: italic;
      display: inline
  }

  .dates {
      display: inline;
  }

  .responsibilities {
      margin-left: 0.75cm;
      display: list-item;
      list-style-type: circle;
  }


  .href {
      float: right;
      width: 6cm;
  }

  .sitename {
      float: left;
      width: 3cm;
  }

  .website {
      width: 9cm;
      font-size: x-small;
  }
    CSS
  end
end

