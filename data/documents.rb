﻿USER_DOCUMENTS= {
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
                phone: '240-671-9368 (cell)',
                email: {
                    link: 'mailto:jeffwaltzer@gmail.com',
                    text: 'jeffwaltzer@gmail.com'},
            },

            summary:
                'Senior Ruby on Rails Engineer with extensive experience in developing ground-up mission-critical projects. ' +
                    'Responsible for the conception, coding, testing, implementation, user training, and technical support of new systems. ' +
                    'Seeking a position that fully leverages my extensive experience in Behavior Driven Development (BDD), ' +
                    'software design, architecture and agile development methodologies.',

            skills: {
                header: 'Programming Languages, Databases, Tools',
                text: 'Ruby 1.9.3, Ruby on Rails 3.2, RSpec, Jruby, jQuery, CoffeeScript, Haml, JavaScript, XML, MySQL, PostgreSQL, PostGIS, Oracle, Linux, Soap4r, Java, JUnit'},

            education: {
                header: 'Education',
                text: 'BS, Computer Science, University of Bridgeport',
            },

            development: {
                header: 'Professional Development',
                projects: [{
                               link: 'http://agilemaryland.org',
                               text: 'Organizer for the weekly Ruby on Rails CodeFest in Columbia, MD.'},
                           {
                               link: 'https://github.com/JeffWaltzer',
                               text: 'Developed projects including a Ruby refactoring tool, Podcast feed reader and web based GPS tracker.'},
                ]},

            experience: {
                header: 'Experience',
                jobs: [
                    {
                        title: 'Senior Ruby on Rails Developer',
                        company: {text: 'Kit Check, Washington DC', link: 'http://kitcheck.com'},
                        dates: '1/2014 – present',
                        responsibilities: [
                            'Built REST business application logic API with Ruby 2.1 and Rails 4.0. Used Apipie to document REST endpoints,'+
                                ' Minitest for unit/functional tests, Dossier for report generation, and Devise for user authentication.',
                            'Implemented business domain model using Test Driven Development. Verified correct function with 98% test coverage.'+
                                '  Implemented numerous macros and helper methods to increase code readability, ease of maintenance and extensibility.',
                            'Refactored User validation/permissions code with meta-programming to reduce code duplication '+
                                'and simplify implementation of user access requirements.',
                            'Implemented database design changes with Rails migrations to create a more consistent and normalized data model.'                                ,
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

                    {
                        title: 'Software Engineer',
                        company: 'AJILON, Baltimore, MD and Washington, DC',
                        dates: '1996-2001',
                        clients: [
                            {
                                company: 'World Bank (Contract), KPMG (Contract), Banking Services Corporation (Contract)',
                                responsibilities: [
                                    'Provided the toolkit to handle the scanning and imaging needs of the World Bank\'s  documents.',
                                    'Developed REMIC (mortgage-backed securities) Tax Setup software.',
                                    'Implemented \'wizard\' style interface to maximize customer usability.',
                                    'Constructed code to assist other developers in the general programming of the application that tracked and facilitated auto lease telemarketing.',
                                    'Performed DBA functions to assist the staff DBA on this project.'
                                ]},
                        ]},
                ]},

            additional_info: {
                header: 'Links',
                website: [
                    {sitename: 'GitHub', href: {link: 'http://github.com/jeffwaltzer'}, },
                    {sitename: 'LinkedIn', href: {link: 'http://www.linkedin.com/in/jeffwaltzer/'}, },
                    {sitename: 'MyTrack', href: {link: 'http://mytrack.herokuapp.com'}, },
                    {sitename: 'TastyDoc', href: {link: 'http://tastydoc.com'}, },
                ]
            }
        }
    },

  johnmaxwell: {
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
      nobreak_sections: [:company]},

    resume: {
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
        text: 'Software development, Agile Methods (Extreme Programming), Device Drivers, Embedded Applications, Web Applications, Ajax, Client/Server Applications. C, C++, Assembler, JavaScript, Lisp, Scheme, Fortran, Ruby, Ruby on Rails, jQuery, XML, Linux, MySQL'
      },

      education: {
        header: 'Education',
        text: 'BA Physics, University of Maryland, Baltimore County',
      },

      development: {
        header: 'Professional Development',
        projects: ['Agile Maryland CodeFest',
                   'Floyd Code Retreat.']},

      experience: {
        header: 'Employment History',
        jobs: [
               {
                 company: 'OpenAmplify, Annapolis, MD',
                 dates: '5/2009 – present',
                 title: 'Senior Software Engineer',
                 responsibilities: ['Developed and enhanced semantic text analysis software C++ running as a web service (REST and SOAP APIs) under Linux in the Amazon EC2 cloud.',
                                    'Developed various front end applications for the service in C++, JavaScript, Scheme, and Ruby.',
                                    'Coded prototype and experimental applications for linguistic R&D group, then participated in incorporating successful R&D efforts into production software.',
                                    'Maintained and enhanced administrative scripts in Ruby for administration of servers in the EC2 cloud.']
               },
               {
                 company: 'Rimark Technologies, Frederick, MD',
                 dates: '2007',
                 title: 'Head of Software',
                 responsibilities: ['Founding member of a startup producing digital panel voltage meters.',
                                    'Wrote meter firmware.',
                                    'Defined and implemented communications protocols for the meters.',
                                    'Wrote Windows GUI for interfacing to meters.',
                                    'Wrote Windows utilities for meter production.']},
               
               {
                 company: 'Harsh Environment Applied Technologies, White Plains, MD',
                 dates: '2004 - 2008',
                 title: 'Senior Software Engineer',
                 responsibilities: ['Independent consultant under contract for work on several DoD contracts.',
                                    'Developed embedded application in C++ under embedded Linux.',
                                    'Developed applications on PIC microcontrollers in C and Assembler for various custom hardware.',
                                    'Wrote interface software and device drivers for a variety of off the shelf and custom hardware.']
               },

               {
                 company: 'GE Medical Systems, Annapolis, MD',
                 dates: '1998 - 2004',
                 title: 'Senior Software Engineer',
                 responsibilities: ['Maintained and enhanced client/server and Web based medical record keeping software in C++, SQL-Server, and VB6.',
                                    'Implemented interfaces to third-party hardware and software.',
                                    'Provided back-end customer support.']},
               
               {
                 company: 'Aerotek/Maxim Group',
                 dates: '1996 - 1998',
                 title: 'Contract Programmer',
                 responsibilities: ['Designed and developed application software in C++ for several customers, running under Windows (95/98/NT4).']
               },

               {
                 title: 'Programmer',
                 company: 'BYK Gardner USA, Silver Spring, MD',
                 dates: '1988 - 1996',
                 responsibilities: ['Developed and maintained color matching software for retail paint stores in C and assembler.',
                                    'Maintained and enhanced embedded software for colorimeters.',
                                    'Wrote and supported test software for hardware manufacturing.',
                                    'Wrote and supported software for lab use.']
               },
               
               {
                 company: 'Logistics Data Systems, Potomac, MD',
                 dates: '1985 - 1988',
                 title: 'Programmer',
                 responsibilities: ['Developed and maintained a specialized CAD system for retail store shelf layouts, running under MS-DOS.',
                                    'Implemented device drivers for pen plotters and other graphical output devices.',
                                    'Ported software from MS-DOS to VMS, DOS extenders, and Xenix.',
                                    'Provided customer support.']
               },
              ]
      }
    }
  }
}
