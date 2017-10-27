# Product List : iOS Integration

This project contains simple iOS integration of Open Product  API with swift 3.1

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

OS : macOS Sierra : 10.12.6
Xcode : 9.0.1
Swfit : 4.0


### Installing

Clone the repo and 
Double click on the ProductList.xcworkspace and open with Xcode 9.0.1 only using Swift 4.0
Install SwiftLint using brew or comment the script for siwftlint in the build scripts

## Running the tests

Use standard Apple Xcode XC test framework to run the test 
Use Command + U to run the rest 
The unit test are writing inside ProductListTests.swift

### Libraries 

SDWebImage is used for caching product images

### Unit Test Details

testCurrencyFormatter : 
1. will test the currency format to string from NSNumber input.
2. returns nil if unwanted data is the input. 

testProductListLoaded
1. Will test if the data loaded inside the ProductService.json is not nil. 

testParseData
1. Will test all the parsing features of the code. 
2. Will test if the productCache / Product  Data model contains the expected data. 

### And coding style tests

1. use camel case for variable names 
2. use swifty way of function declaration 
3. all constants should be capitalised 
4. all optional should be safely unwrapped using if lets to avoid crashes. 
5. 3 Tier Architecture :
1. API Services : responsible for API calls and parsing of json / raw data from open Product  API services. 
2. Data Manager : responsible for data manuputaion methods and loading stubbed data if required. 
3. Data Model : responsible for storing Product  data model. 
4. view :- responsbile for presentation of views
5. view controller :- responsible for binding views and data models together.  

NSNotification is used for updated data models / views once API services returns back successful data.  

Singleton Objects for caching data 

## Deployment

Simple Xcode Run using iOS simulators on iPhones only. 

## Built With
Xcode 9.0.1

## Versioning
2.0

## Authors

djrecker

