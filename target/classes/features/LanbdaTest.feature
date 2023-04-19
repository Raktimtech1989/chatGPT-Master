#Business Requirement

#Assume that I have a Selenium testing platform that allows users to point their Selenium tests on hub.lambdatest.com. This platform consists of 4 microservices responsible for the following details.

#The first microservice accepts Selenium tests and calls the second microservice to create a test entity in the database.
#The first service then connects with the third service, which provides it with a Linux docker container where Selenium jars and web browsers are present.
#Upon receiving the details for the docker container, the first service proxies the HTTP requests to the docker container.
#The fourth service collects test execution logs from the docker container and exposes APIs to return different logs for every Selenium test.
#Let the first service be called a hub_service, the second service be called test_management_service, the third service is linux_container_service, and the fourth service is log_management_service. Write a Cucumber definition to test this platform

Feature: Selenium Testing Platform

  Scenario: User can execute Selenium tests on the platform
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    Then the test is executed successfully

  Scenario: Test entity is created in the database
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    Then a test entity is created in the test_management_service database

  Scenario: Linux docker container is created for the test
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    Then a Linux docker container is created in the linux_container_service

  Scenario: HTTP requests are proxied to the docker container
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    Then the hub_service proxies the HTTP requests to the docker container in the linux_container_service

  Scenario: Test execution logs are collected and can be accessed
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    Then test execution logs are collected by the log_management_service and can be accessed through its APIs
#Feature: Selenium Testing Platform - Negative Scenarios

  Scenario: Test entity creation fails in the test_management_service
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    And the test_management_service is down
    Then the test cannot be executed and an error message is displayed

  Scenario: Linux docker container creation fails in the linux_container_service
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    And the linux_container_service is down
    Then the test cannot be executed and an error message is displayed

  Scenario: HTTP requests cannot be proxied to the docker container
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    And the linux_container_service is down
    Then the hub_service cannot proxy the HTTP requests and an error message is displayed

  Scenario: Test execution logs cannot be collected by the log_management_service
    Given a Selenium test file
    When the user points the test to the hub.lambdatest.com platform
    And the log_management_service is down
    Then the test can be executed but the logs cannot be collected and an error message is displayed
    