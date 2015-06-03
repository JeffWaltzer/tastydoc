USER_DOCUMENTS= {
  defaults: {
    style_sheet: {
      indented_sections:
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
  },
  jeffwaltzer: {
    resume: {
      contact: {
        name: 'Jeffrey L. Waltzer',
        street: '3 Riverview Court #202',
        city_state_zip: 'Laurel, MD 20707',
        phone: '(240) 547-9474',
        email: {
          link: 'mailto:jeff@waltzer.org',
          text: 'jeff@waltzer.org'},
      },

      summary:
        'Senior Ruby on Rails Engineer with extensive experience in developing ground-up projects. ' +
          'Responsible for the conception, coding, testing, and user training of new systems. ' +
          'Seeking a position that leverages my experience in Behavior Driven Development (BDD), ' +
          'software design, systems architecture and agile development methodologies.',

      skills: {
        header: 'Programming Languages, Databases, Tools',
        text: 'Ruby 2.14, Ruby on Rails 4.1, RSpec, Jruby, jQuery, CoffeeScript, Haml, JavaScript, XML, MySQL, PostgreSQL, PostGIS, Oracle, Linux (Redhat, Ubuntu, etc.), Soap4r'},

      development: {
        header: 'Professional Development',
        projects: [{
                     link: 'http://agilemaryland.org',
                     text: 'Organizer for the weekly Ruby on Rails CodeFest.'},
                   {
                     link: 'https://github.com/JeffWaltzer',
                     text: 'Developed projects including a Ruby refactoring tool and a web based GPS tracker.'},
        ]},

      experience: {
        header: 'Experience',
        jobs: [
          {
            title: 'Senior Ruby on Rails Consultant',
            company: {
              text: 'CRGT contract with the Office of Financial Research (OFR), Washington, DC',
              link: 'http://financialresearch.gov'
            },
            dates: '12/2014 – Current',
            responsibilities: [
              'Developed code for the FRACTAL project that ingested XML data from 40 different countries and persisted it for future processing.',
              "Implemented code using Nokogiri's SAX parser for converting  generic XML to multiple CSV files.  Extended code to populate database tables.",
              "Created a web configurable dataset rules engine to allow users to validate and specify successful data pulls. Rules engine used file counts, files sizes and file mime types as inputs.",
              "Charted dataset pull attempt metrics with Javascript/Jquery and the Highcharts plugin to visually present metrics on the data ingests."
            ]},
          {
            title: 'Senior Ruby on Rails Consultant',
            company: {text: 'Insight Global (AT&T contract), Dallas, TX', link: 'http://kitcheck.com'},
            dates: '7/2014 – 11/2014',
            responsibilities: [
              'Implemented features for a OAuth2 mobile application authentication portal using Ruby on Rails.',
              'Setup Team City server to provide continuous integration to monitor code quality and to regression test code after each checkin.',
              'Reviewed code submissions and advised how unit tests code be better written, how the code code be more object oriented, and gave suggestions ' +
                'on how to increase overall code quality.',
              'Supervised the development/design of OAuth2 native application support.'
            ]},
          {
            title: 'Senior Ruby on Rails Developer',
            company: {text: 'Kit Check, Washington DC', link: 'http://kitcheck.com'},
            dates: '1/2014 – 6/2014',
            responsibilities: [
              'Built REST business application logic API with Ruby 2.1 and Rails 4.0. Used Apipie to document REST endpoints,'+
                ' Minitest for unit/functional tests, Dossier for report generation, and Devise for user authentication.',
              'Implemented business domain model using Test Driven Development. Verified correct function with 98% test coverage.'+
                '  Implemented numerous macros and helper methods to increase code readability, ease of maintenance and extensibility.',
              'Refactored User validation/permissions code with meta-programming to reduce code duplication '+
                'and simplify implementation of user access requirements.',
              'Implemented database design changes with Rails migrations to create a more consistent and normalized data model.',
              'Analysed report queries to find inefficiencies such as missing indexes, n+1 selects and unused eager loading.'+
                ' Applied fixes to decrease report load times from several minutes to a few seconds.',
            ]},
          {
            title: 'Senior Ruby on Rails Developer',
            company: {text: 'LearnZillion, Washington DC', link: 'http://learnzillion.com'},
            dates: '4/2013 – 9/2013',
            responsibilities: [
              'Collaborated with a team to implement a high volume, public facing web site using Ruby on Rails and PostgreSQL to '+
                'assist school districts with Common Core Standards compliance.',
              'Transitioned site to multi-tenant functionality to provide each institution with their own site.',
              'Mentored junior programmers in Object Oriented Programming, BDD, and agile principles/practices.',
              'Created tools using Rake to automate the creation of new customer sites.',
              'Supported team by speeding up application load time, fixing broken unit tests, and providing advice on architecture/object oriented programming.',
              'Created and maintained TeamCity CI server to provide team with feedback on regression errors and deployability.'
            ]},
          {
            title: 'Senior Ruby on Rails Consultant',
            company: {text: 'Sol Systems (contract), Washington DC', link: 'http://www.solsystemscompany.com/'},
            dates: '10/2012 – 2/2013',
            responsibilities: [
              'Developed new software and helped to maintain existing Ruby on Rails website used in daily operations.',
              'Utilized BDD with Rspec to drive functionality and to ensure proper implementation of new features.',
              'Refactored code to improve system architecture and to increase object orientation.',
              'Applied MiniProfiler and Bullet profiling tools to increase efficiency of database access .',
              'Converted HTML/JavaScript into Haml/CoffeeScript to improve code clarity.',
              'Used jQuery Datatables and Ajax calls to improve user experience.']},

          {
            title: 'Senior Ruby on Rails Developer',
            company: 'Unissant (NASA contract), Riverdale, MD',
            dates: '5/2011 – 7/2012',
            projects: [{
                         name: {text: 'NASA ECHO web site', link: 'http://reverb.echo.nasa.gov'},
                         responsibilities: [
                           "As a member of an agile Scrum team, supported development for NASA's ECHO website. System used Ruby 1.9.2 (JRuby) , Ruby on Rails 3.1, Elastic Search, Cucumber, Oracle 11g, jQuery, GeoRuby, Tomcat, Git, and RESTful web services.",
                           'Created interface for RESTful web service API at JavaScript and Rails levels. Used jQuery Ajax calls to display remote system call progress. Added jQuery pop-up for dynamic display of images.',
                           'Enhanced jQuery DataTables to display search results giving users the ability to resize, rearrange, and minimize columns. Created auto-complete lookup for place names typed in by the user. Utilized Jasmine library to unit test JavaScript code.',
                           'Applied Cucumber testing tool to verify functionality of ECHO Reverb website. Utilized Rspec for unit level testing.',
                           'Tutored fellow team members on unit testing and BDD',
                           "Advised team on system's architecture, object oriented design, clean code concepts, unit testing and on methods to improve code readability."]}]},

          {
            title: 'Senior Software Engineer',
            company: 'Boxtone Inc., Columbia MD',
            dates: '7/2010 - 3/2011',
            responsibilities: [
              'Developed with an user experience expert, user interface dialogs for a mobile device management system. The dialogs were implemented using Ruby on Rails, Protoype, JavaScript and CSS.',
              'Designed/implemented a REST interface in Ruby on Rails to enabled the device management system ability to communicate with a mail server front-end service. Interface used the RestClient Ruby gem.',
              'Coached developers on implementing RESTful interfaces in Java.',
              'Developed Rails back-end code that interfaced with legacy Oracle DB system.']},

          {
            title: 'Senior Software Engineer',
            company: 'Greenhorne & O\'Mara, Laurel MD',
            dates: '6/2009 – 7/2010',
            responsibilities: [
              'Developed a Ruby on Rails facilities maintenance application that used GIS to draw building and room layouts using JavaScript, PostGIS and OpenLayers.',
              'Created virtual machine deployments of CentOS Linux systems running Ruby on Rails applications with PostGIS and Oracle. ',
              'Practiced BDD using RSpec to achieve high reliability and ease of code change.']},

          {
            title: 'Senior Software Engineer',
            company: 'Traffipax Inc, Linthicum MD',
            dates: '2007 - 2009',
            responsibilities: [
              'Responsible for development support for a Ruby on Rails replacement of a legacy Java system.',
              'Mentored and encouraged the use of agile development methodologies including test driven development, refactoring, pair programming, continuous integration, refactoring, and iterations.',
              'Acheived 100% code covergage with TDD using RSpec.',
              'Refactored database schema design to meet changing business requirements.',
              'Created SOA interfaces for various state DMV computer systems (Restfull and SOAP).',
              'Refactored code base to improve system architecture.',
              'Implemented report generation system with dynamically generated input pages.',
              'Wrote image manipulation code using RMagick.'
            ]},
          {
            title: 'Senior Software Development Consultant',
            company: 'Fannie Mae, Washington, DC',
            dates: '2005-2007',
            projects: [{
                         name: 'eMortgage web site (Contract)',
                         responsibilities: [
                           'Member of a agile development team working on a eMortgage loan system.',
                           'BEA Weblogic and the Apache Tapestry web framework was used for the front end.',
                           'Implemented data persistence layer with the Hibernate framework accessing an Oracle 8i database.',
                           'Used the Xerces XML library to process and analyse SMARTDOC eMortgage packages, and to perform digital signature validation on them.',
                           'High quality code was created using JUnit with Test Driven Development',
                           'Mentored team on project agility, unit testing, Object Oriented Programming, refactoring, design patterns and other practices to increase projects agility to deal with changing requirements.',
                           'Team achieved 95% code coverage with unit tests resulting in a very number of defects found.',
                           'Helped design and architect many aspects of the system to create code that had low coupling and was easy to maintain.']}]},

          {
            title: 'Senior Software Engineer',
            company: 'Spirent Communications, Rockville, MD (Contract)',
            dates: '2004',
            projects: [{
                         name: 'Intranet Network Diagnostic System',
                         responsibilities: [
                           'Followed Extreme Programming (XP) methodologies, including iterations, test-driven development, and paired programming.',
                           'Developed product using Java 1.4, Jakarta Tomcat, MySQL, JUnit and Eclipse.',
                           'Used XPath to parse XML received over TCP/IP from legacy application.',
                           'Used refactoring to improve the program architecture.',
                           'Mentored Team. Provided expertise in XP, Object-Oriented Programming and test-driven development to programming team.']}]},

          {
            title: 'Senior Software Engineer',
            company: 'MadWolf Technologies, Washington DC',
            dates: '2001-2003',
            responsibilities: [
              'Developed a system to support a web based message forum system using Jakarta Struts.',
              'Introduced TDD (Test-Driven Development) to insure correctness and to avoid regression errors.',
              'Managed changing requirements through agile development principles.',
              'Using Jakarta Tomcat 4.1 with Oracle 8i, implemented a Business work flow application for a real estate title research company.',
              'Extensive use of refactoring was used to minimize and eliminate code duplication.', 'Developed an extensible web-based reporting tool using Java Servlets accessing an Oracle database.',
            ]},
        ]},

      education: {
        header: 'Education',
        text: 'BS, Computer Science, University of Bridgeport'
      },

      additional_info: {
        header: 'Links',
        website: [
          {sitename: 'GitHub', href: {link: 'http://github.com/jeffwaltzer'}, },
          {sitename: 'LinkedIn', href: {link: 'http://www.linkedin.com/in/jeffwaltzer/'}, },
          {sitename: 'MyTrack', href: {link: 'http://mytrack.herokuapp.com'}, },
        ]
      }
    }
  }
}
