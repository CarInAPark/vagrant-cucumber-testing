Feature: Service
  The service should be up and running

Scenario: Check API is up and running
  When making GET request
  Then the response should be:
  """
  <html>
  <head>
      <title></title>
  </head>
  <body>
  <!--This page is intentionally left blank-->
  </body>
  </html>
  """