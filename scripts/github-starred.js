#!/usr/bin/env node

var commandLineArguments = process.argv.slice(2);

var util = require('util');
var js   = require('jsonfile');

//console.l[MB4(og(util.inspect(commandLineArguments))
//console.log(commandLineArguments[0])
var user = commandLineArguments[0] !== undefined ? commandLineArguments[0] : process.env.USER;
var github = require('octonode');
var client = github.client();
var repos = [];

var showData = function(data)
{
    if(data === undefined || data.length == 0)
        return;

    data.forEach(function(repo)
    {
        //console.log(repo.language + "|" + repo.name + "|"+repo.full_name + "|" + repo.clone_url + "|"  + JSON.stringify(repo));
        console.log(repo.language + "|"+repo.full_name + "|" + repo.clone_url);
        repos.push(repo);
    });
};

client.get('/users/'+user+'/starred', {}, function (err, status, body, headers) 
{
    //console.log(body); //json object
    if(err != null)
        console.log("error: " + err);
    if(status !== 200)
        console.log("status:" + status);
    //console.log("data: " + data);
    console.log("headers:" + util.inspect(headers));
    console.log(headers.link);
    if(status == 403)
        return;
    //var next = headers.link.split(",")[0].split(";")[0].replace('<','').replace('>','').replace(' ', '');
    var last = headers.link.split(",")[1].split(";")[0].replace('<','').replace('>','').replace(' ', '');
    //console.log(next);
    //console.log(last);

    showData(body);

    var lastIndex = last.split("?")[1].split("=")[1];
    console.log("get 1.."+lastIndex);
    for(var i = 2; i <= lastIndex; i++)
    {
        setTimeout((function(num)
        { 
            return function()
            {
            console.log(num);
                client.get('/users/'+user+'/starred', { page: num }, function (err1, status1, body1, headers1) 
                {
                    if(status !== 200)
                        console.log("status:" + status);
                    if(err1 != null)
                        console.log("error: " + err1);
                    if(status == 403)
                        return;
                    showData(body1);
                    console.log("collected " + repos.length);
                    if(num == lastIndex)
                    {
                        console.log("=================");
                        console.log(util.inspect(repos));
                        js.writeFile(user+'-starred.json', repos, function(err) 
                        { //json file has four space indenting now
                          console.log(err);
                        });
                    }
                });
            }
        })(i), 5000*i);
    }
});

//var user = process.env.GITHUB_USER;
//var pass = process.env.GITHUB_PWD;
/*
var client = github.client({
  username: user,
  password: pass
});

var ghme   = client.me();
ghme.starred({
      page: 2
}, function(err, data, headers){
//    console.log(data);
    console.log(headers);
    console.log(err);

    for(var i = 0; i < data.length ; i++){
    console.log(data[i].full_name);
    }

    console.log(headers.link);
    var next = headers.link.split(",")[0].split(";")[0].replace('<','').replace('>','').replace(' ', '');
    var last = headers.link.split(",")[1].split(";")[0].replace('<','').replace('>','').replace(' ', '');
    console.log(next);
    console.log(last);
}); //array of repos

/*
var https = require("https");
var userName=process.env.USER;
var options = {
host :"api.github.com",
path : '/users/'+userName+'/starred',
method : 'GET',
headers: {'user-agent':'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'}
}

var request = https.request(options, function(response){
var body = '';
response.on('data',function(chunk){
    body+=chunk;
});
response.on('end',function(){
    var json = JSON.parse(body);
    var repos =[];
    json.forEach(function(repo){
        repos.push({
            name : repo.name,
            description : repo.description
        });
    });
    console.log('the repos are  '+ JSON.stringify(repos));
});

});
request.on('error', function(e) {
console.error('and the error is '+e);
});
request.end();
*/