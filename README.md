# README
This is the JS snippet you can put in your app to track events.  In Rails, put this snippet in app/assets/javascripts/application.js:

```var blocmetrics = {};
    blocmetrics.report = function(eventName){
      var event = {event: { name: eventName }};
      var request = new XMLHttpReqest();
      request.open("POST", "http://localhost:3000/api/events", true);
      request.setRequestHeader('Content-Type', 'application/json');
      request.send(JSON.stringify(event));
    };```
