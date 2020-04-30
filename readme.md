## Test 1

Converted existing dockerfile to multistage

Corrected issue with application.

Build the image by running

`docker build -t anz1 .`

Run the image by running

`docker run -p8000:8000 -t anz1`

Application should be available on `localhost:8000` and respond with "Hello, World"