# Welcome to File Receipt :wave:

<p align="center">
  <img src="https://assets.nuuvem.com/assets/fe/images/nuuvem_logo-ab61ec645af3a6db7df0140d4792f31a.svg" alt="qcx" width="160" /> 
</p>


The project is about importing a company's sales from a text file (separated by tabs - [file](example_input.tab)).

[About the challenge](about.md)

## Running the project

 ```shell
- Ruby - 2.7.2
 - Rails - 6.0.3
```
## :information_source: Step by Step
1. Create the database
   ```
   rails db:create
   ```
2. Run the migrations
   ```
   rails db:migrate
   ```
3. Install gems and dependencies
   ```
   bundle install
   ```
   ```
   yarn install
   ```
4. Run the tests
   ```
   rspec
   ```
5. Run the application
   ```
   rails server
   ```

## :information_source: To access the project in the browser

```
localhost:3000
```

## :information_source: Documentation
For this project, a separate guide was provided with sales data for merchants and purchasers. Our goal was to model the project so that it was possible to upload the file and consume this data.


### Author

[Matheus Marques](https://www.linkedin.com/in/matheuscmarques/)
