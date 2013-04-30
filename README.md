tastydoc
========

TastyDoc is a document formatting system. It takes a master document expressed as a semantic data structure, and allows the user to present it in various formats (HTML, pdf, etc.).

A document consists of a hash.

The keys to hash are are completely irrelevant, except in a variety of
special cases noted below. In general, the values are treated as an
array.

Special cases
=============

If the hash contains the key :header, the value of that key is the
header for the section. (String only?)

If the hash contains the key :link, the section is formatted as a
link. The value of the :link key is the address to link to.

