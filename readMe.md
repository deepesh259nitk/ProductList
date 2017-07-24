Product List : iOS Integration

This project contains simple iOS integration of Product List with swift 3.1
Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
Prerequisites

OS : macOS Sierra : 10.12.4 Xcode : 8.3.1 Swift : 3.1
Installing

Clone the repo and Double click on the ProductList.xcworkspace and open with Xcode 8.3.1 only using Swift 3.1
Running the tests

Use standard Apple Xcode XC test framework to run the test Use Command + U to run the rest The unit test are writing inside WeatherForecastTests.swift
Unit Test Details

example 

testProductListLoaded

    Will test if the data loaded inside the ProductService.json is not nil.

testParseData

    Will test all the parsing features of the code.
    Will test if the productCahce / Product Data model contains the expected data.

And coding style tests

    use camel case for variable names
    use swifty way of function declaration
    all constants should be capitalised
    all optional should be safely unwrapped using if lets to avoid crashes.
    3 Tier Architecture :
        API Services : responsible for API calls and parsing of json / raw data from open product API services.
        Data Manager : responsible for data manuputaion methods and loading stubbed data if required.
        Data Model : responsible for storing weather data model.
        view :- responsbile for presentation of views
        view controller :- responsible for binding views and data models together.

NSNotification is used for updated data models / views once API services returns back successful data.

Singleton Objects for caching data
Deployment

Simple Xcode Run using iOS simulators on iPhones only.
Built With

Xcode 8.3.1
Versioning

1.0
Authors

djrecker
