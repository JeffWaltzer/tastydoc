RESUMES= {

  jeffwaltzer: {
    contact: {
      name: 'Jeffrey L. Waltzer',
      street: '3 Riverview Court #202',
      city_state_zip: 'Laurel, MD 20707',
      phone: '240-671-9368 (cell)',
      email: {
        link: 'mailto:jeffwaltzer@gmail.com',
        text: 'jeffwaltzer@gmail.com'},
    },

    summary: 'Senior Ruby on Rails Programmer with extensive experience doing ground-up development for several mission-critical projects.   Responsible for the concept, coding, testing, implementation, user training, and technical support of new systems. Experienced with agile development methodologies and Behvaior Driven Development. ',

    skills: {
      header: 'Programming Languages, Databases, Tools',
      text: 'Ruby 1.9.3, Ruby on Rails 3.2, RSpec, Jruby, jQuery, CoffeeScript, Haml, JavaScript, XML, MySQL, PostgreSQL, PostGIS, Oracle, Linux (Ubuntu, Red Hat, CentOS), Soap4r,  Java, J2EE, Hibernate, Eclipse IDE, JUnit, Assembler, RubyMine'},

    education: {
      header: 'Education',
      text: 'BS, Computer Science, University of Bridgeport',
    },

    development: {
      header: 'Professional Development',
      projects: [{
                   link: 'http://agilemaryland.org',
                   text: 'Organizer for the Ruby on Rails code fest in Columbia, MD.'},
                 'Projects developed included a Ruby refactoring tool, Podcast feed reader and web based GPS tracker.']},

    experience: {
      header: 'Experience',
      jobs: [
        {
          title: 'Senior Ruby on Rails Consultant',
          company: 'LearnZillion',
          dates: '4/2013 – 9/2013',
          responsibilities: ['Mentored coworkers about Behavior Driven Development',
                             ]},
        {
          title: 'Senior Ruby on Rails Consultant',
          company: 'Sol Systems (contract), Washington DC',
          dates: '10/2012 – 2/2013',
          responsibilities: ['Developed new software and helped maintained existing Ruby on Rails website used in day to day operations.',
                             'Advised on programming design principles.',
                             'Used Behavior Driven Development with Rspec to drive functionality and to ensure proper implementation of new features.',
                             'Refactored code to improve the system architecture and to make it more object oriented.',
                             'Used MiniProfiler and Bullet profiling tools to find inefficient database usage.',
                             'Converted HTML/Javascript into HAML/Coffeescript for improved code clarity.',
                             'Used JQuery Datatables and Ajax calls to improve user experience.']},

        {
          title: 'Senior Ruby on Rails Developer',
          company: 'Unissant (NASA contract), Riverdale, MD',
          dates: '5/2011 – 7/2012',
          responsibilities: [
            "Ruby on Rails development for NASA's http://reverb.echo.nasa.gov website on an agile Scrum team. System used Ruby 1.9.2 (JRuby) , Ruby on Rails 3.1, Elastic Search, Cucumber, Oracle 11g, Jquery, GeoRuby, Tomcat, Git,  RESTful web services.",
            "Implemented interaction with ESI's RESTful web service API at both Javascript and Rails levels.  Used Jquery ajax calls to display remote system call progress.  Added dynamic display of images in a Jquery pop-up.",
            "Enhanced Jquery DataTables that displayed search results to give users the ability to resize/minimize columns, rearrange columns.  Also created UI element that did autocomplete on place names as they were typed in by the user.  Used Jasmine library to unit test Javascript code.",
            "Used Cucumber testing tool to verify ECHO Reverb at a functional level.  Rspec and MiniTest for testing at the unit level.",
            "Tutored fellow team members on unit testing and BDD (Behavior Driven Development)",
            "Frequently refactored code and advised team on system architecture, object oriented design, clean code concepts, unit testing with Behavior Driven Development and enhanced readability."]},

        {
          title: 'Senior Software Engineer',
          company: 'Boxtone Inc., Columbia MD',
          dates: '7/2010 - 3/2011',
          responsibilities: [
            'Developed with an user experience expert, user interface dialogs for a mobile device management system. The dialogs were implemented using Ruby on Rails, Protoype, Javascript and CSS.',
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
            'Practiced Behavior Driven Development (BDD) using RSpec to achieve high reliability and ease of code change.']},

        {
          title: 'Senior Software Engineer',
          company: 'Traffipax Inc, Linthicum MD',
          dates: '12/2007 - 3/2009',
          responsibilities: [
            'Responsible for development support for a Ruby on Rails replacement of a legacy Java system.',
            'Mentored and encouraged the use of agile development methodologies including test driven development, refactoring, pair programming, continuous integration, refactoring, and iterations.',
            'Acheived 100% code covergage with TDD using RSpec.',
            'Refactored database schema design to meet changing business requirements.',
            'Created SOA interfaces for various state DMV computer systems (Restfull and SOAP).',
            'Refactored code base to improve system architecture.',
            'Implemented report generation system with dynamically generated input pages.',
            'Wrote image manipulation code using RMagick.']},

        {
          title: 'Senior Software Engineer',
          company: 'AJILON, Baltimore, MD and Washington, DC',
          dates: '6/2007 - 12/2007',
          clients: [{
                      company: 'Wachovia (Contract)',
                      responsibilities: [
                        'Updated legacy applications to new architecture to Spring framework using refactorings.',
                        'Advised on existing architecure and suggested future improvements.',
                        'Architecture used IBM Websphere J2EE with Spring, and Hibernate.']}]},

        {
          title: 'Senior Software Consultant',
          company: 'AARP, Washington, DC (Contract)',
          dates: '2007',
          projects: [{
                       name: 'Community web site',
                       responsibilities: [
                         'Participated and advised in the use of Scrum development methodologies.',
                         'Added \'invite friend to forum\' functionality using Java Javamail Java 1.5 with Hibernate, MySQL for the backend and Jakarta Struts for the front end.',
                         'Used JRuby library to integate a user login web service API written in Ruby into Java code.',
                         'Mentored team on project agility, unit testing/Test Driven Development, Object Oriented Programming, refactoring, design patterns.']}]},

        {
          title: 'Senior Software Development Consultant',
          company: 'Fannie Mae, Washington, DC',
          dates: '2005-2007',
          projects: [{
                       name: 'eMortgage web site (Contract)',
                       responsibilities: [
                         'Member of a agile development team working on a eMortgage loan system.',
                         'BEA Weblogic and the Apache Tapestry web framework was used for the front end.',
                         'The data persistence layer was implemented using the Hibernate framework accessing an Oracle 8i database.',
                         'Used the Xerces XML library to process and analyse SMARTDOC eMortgage packages, and to perform digital signature validation on them.',
                         'High quality code was created using JUnit with Test Driven Development',
                         'Mentored team on project agility, unit testing, Object Oriented Programming, refactoring, design patterns and other practices to increase projects agility to deal with changing requirements.',
                         'Team achieved 95% code coverage with unit tests resulting in a very number of defects found.',
                         'Helped design and architect many aspects of the system to create code that had low coupling and was easy to maintain.']}]},

        {
          title: 'Senior Software Engineer',
          company: 'Wondir, Bethesda, MD',
          dates: '2005',
          projects: [{
                       name: 'Wondir.com web site',
                       responsibilities: [
                         'Wondir.com web site',
                         'Used Jakarta Tomcat with MySQL for the database and Jakarta Lucene for search indexing.',
                         'Supported software development at a Internet startup company.',
                         'Implemented a paginated search page using Jakarta Lucene',
                         'Applied Test Driven Development to legacy code, with JUnit regression tests of the legacy code.']}]},


        {
          title: 'Senior Software Engineer',
          company: 'Digital Focus, Columbia, MD',
          dates: '2004',
          clients: [{
                      company: 'Arbitron (Contract)',
                      project: {
                        name: 'Report Generator and Scheduling System',
                        responsibilities: [
                          'Developed new code in Scrum environment.',
                          'Mentored others in the use of JUnit in writing unit tests.',
                          'Developed rich client interface dialogs in Java using Eclipse\'s SWT and Eclipse\'s RCP frameworks.',
                          'Advised fellow coders on what coding patterns to use to solve design problems.',
                          'Refactored existing code to maximize reuse and minimize code duplication.']}}]},

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
          projects: [{
                       name: 'Web-based contention resolution forum system',
                       responsibilities: [
                         'Developed a system to support a web based message forum system using Jakarta Struts.',
                         'Introduced TDD (Test-Driven Development) to insure correctness and to avoid regression errors.',
                         'Managed changing requirements through agile development principles.']},

                     {
                       name: 'Intranet web-based work flow application',
                       responsibilities: [
                         'Using Jakarta Tomcat 4.1 with Oracle 8i, implemented a Business work flow application for a real estate title research company.',
                         'Extensive use of refactoring was used to minimize and eliminate code duplication.']},
                     {
                       name: 'Web-based Java Reporting Tool',
                       responsibilities: [
                         'Developed an extensible web-based reporting tool using Java Servlets accessing an Oracle database.',
                         'Reports were edited using HTML web forms generated by the Java Servlets.',
                         'Patterns and object-oriented programming concepts were exploited to make the system adaptable.']}]},

        {
          title: 'Software Engineer',
          company: 'AJILON, Baltimore, MD and Washington, DC',
          dates: '1996-2001',
          clients: [{
                      company: 'World Bank (Contract)',
                      responsibilities: [
                        'Developed a 32-bit replacement object oriented imaging toolkit with a Visual Basic 6.0 ActiveX user control for use in other applications such as MS Word and Lotus Notes.',
                        'Provided the toolkit to handle the scanning and imaging needs of the World Bank\'s  documents.']},

                    {
                      company: 'KPMG (Contract)',
                      responsibilities: [
                        'Used Visual Basic 5.0 to develop REMIC (mortgage-backed securities) Tax Setup software.',
                        'Implemented \'wizard\' style interface to maximize customer usability.',
                        'Enhanced preexisting REMIC tax tracking program to increase report generation speed.']},

                    {
                      company: 'Banking Services Corporation (Contract)',
                      responsibilities: [
                        'Constructed code to assist other developers in the general programming of the application that tracked and facilitated auto lease telemarketing.',
                        'Performed DBA functions to assist the staff DBA on this project.']}]},

        {
          title: 'Software Engineer',
          company: 'Information Concepts Inc., Washington, DC',
          dates: '1994-1996',
          responsibilities: [
            'Developed a nutritional labeling program using Visual Basic and MS-Access that handled data entry of new recipes, calculation of nutrients and printing of new labels.',
            'Improved a front-end package that provided a GUI Interface for a legislative on-line database. Added Internet (TCP/IP) access, significant performance improvements, and improved user interface.']}]}},

  johnmaxwell: {

    contact: {
      name: 'John A. Maxwell',
      street: '1551 Alcova Drive',
      city_state_zip: 'Davidsonville, MD 21035',
      phone: '301-535-0225',
      email: 'jmax@toad.net',
    },

    summary: 'Senior Software Engineer with experience in desktop, embedded, and web apps.',

    skills: {
      header: 'Skills',
      text: 'Software development, Agile Methods (Extreme Programming), Device Drivers, Embedded Applications, Web Applications, AJAX, Client/Server Applications. C, C++, Assembler, Javascript, Lisp, Scheme, Fortran, Ruby, Ruby on Rails, jQuery, XML, Linux, MySQL'
    },

    education: {
      header: 'Education',
      text: 'BA Physics, University of Maryland, Baltimore County',
    },

    development: {
      header: 'Professional Development',
      projects: ['Agile Maryland Codefest',
                 'Floyd Code Retreat.']},

    experience: {
      header: 'Employment Hostory',
      jobs: [
        {title: 'Senior Software Engineer',
         company: 'OpenAmplify, Annapolis, MD',
         dates: '5/2009 – present',
         responsibilities: ['Developed and enhanced semantic text analysis software C++ running as a web service (REST and SOAP APIs) under Linux in the Amazon EC2 cloud.',
                            'Developed various front end applications for the service in C++, Javascript, Scheme, and Ruby.',
                            'Coded prototype and experimental applications for linguistic R&D group, then participated in incorporating successful R&D efforts into production software.',
                            'Maintained and enhanced administrative scripts in Ruby for administration of servers in the EC2 cloud.']},

        {title: 'Head of Software',
         company: 'Rimark Technologies, Frederick, MD',
         dates: '2007',
         responsibilities: ['Founding member of a startup producing digital panel voltage meters.',
                            'Wrote meter firmware.',
                            'Defined and implemented communications protocols for the meters.',
                            'Wrote Windows GUI for interfacing to meters.',
                            'Wrote Windows utilities for meter production.']},

        {title: 'Senior Software Engineer',
         company: 'Harsh Environment Applied Technologies, White Plains, MD',
         dates: '2004 - 2008',
         responsibilities: ['Independent consultant under contract for work on several DoD contracts.',
                            'Developed embedded application in C++ under embedded Linux.',
                            'Developed applications on PIC microcontrollers in C and Assembler for various custom hardware.',
                            'Wrote interface software and device drivers for a variety of off the shelf and custom hardware.']},

        {title: 'Senior Software Engineer',
         company: 'GE Medical Systems, Annapolis, MD',
         dates: '1998 - 2004',
         responsibilities: ['Maintained and enhanced client/server and Web based medical record keeping software in C++, SQL-Server, and VB6.',
                            'Implemented interfaces to third-party hardware and software.',
                            'Provided back-end customer support.']},

        {title: 'Contract Programmer',
         company: 'Aerotek/Maxim Group',
         dates: '1996 - 1998',
         responsibilities: ['Designed and developed application software in C++ for several customers, running under Windows (95/98/NT4).']},

        {title: 'Programmer',
         company: 'BYK Gardner USA, Silver Spring, MD',
         dates: '1988 - 1996',
         responsibilities: ['Developed and maintained color matching software for retail paint stores in C and assembler.',
                            'Maintained and enhanced embedded software for colorimeters.',
                            'Wrote and supported test software for hardware manufacturing.',
                            'Wrote and supported software for lab use.']},

        {title: 'Programmer',
         company: 'Logistics Data Systems, Potomac, MD',
         dates: '1985 - 1988',
         responsibilities: ['Developed and maintained a specialized CAD system for retail store shelf layouts, running under MS-DOS.',
                            'Implemented device drivers for pen plotters and other graphical output devices.',
                            'Ported software from MS-DOS to VMS, DOS extenders, and Xenix.',
                            'Provided customer support.']},
      ]}}
}
