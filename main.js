const express = require("express")
const app = express()
const { exec } = require('child_process');

app.post("/", (req, res) => {
    console.log("Got a ping!");

    var child = exec('sh /app/pull.sh', (error, stdout, stderr) => {
        console.log('stdout: ' + stdout);
        console.log('stderr: ' + stderr);
        if (error !== null) {
	    res.status(500).send("Failure!");
            console.log('exec error: ' + error);
        } else {
	    res.send("Success!");
	}
    });
});

var port = 8000;

app.listen(port, () => {
    console.log(`Listening to requests on http://localhost:${port}`);
});
