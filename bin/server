#!/usr/bin/env node

var http = require("http");
var path = require("path");
var fs   = require("fs");

var PORT = 8000;

var dir = process.cwd();

var folderIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGrSURBVDjLxZO7ihRBFIa/6u0ZW7GHBUV0UQQTZzd3QdhMQxOfwMRXEANBMNQX0MzAzFAwEzHwARbNFDdwEd31Mj3X7a6uOr9BtzNjYjKBJ6nicP7v3KqcJFaxhBVtZUAK8OHlld2st7Xl3DJPVONP+zEUV4HqL5UDYHr5xvuQAjgl/Qs7TzvOOVAjxjlC+ePSwe6DfbVegLVuT4r14eTr6zvA8xSAoBLzx6pvj4l+DZIezuVkG9fY2H7YRQIMZIBwycmzH1/s3F8AapfIPNF3kQk7+kw9PWBy+IZOdg5Ug3mkAATy/t0usovzGeCUWTjCz0B+Sj0ekfdvkZ3abBv+U4GaCtJ1iEm6ANQJ6fEzrG/engcKw/wXQvEKxSEKQxRGKE7Izt+DSiwBJMUSm71rguMYhQKrBygOIRStf4TiFFRBvbRGKiQLWP29yRSHKBTtfdBmHs0BUpgvtgF4yRFR+NUKi0XZcYjCeCG2smkzLAHkbRBmP0/Uk26O5YnUActBp1GsAI+S5nRJJJal5K1aAMrq0d6Tm9uI6zjyf75dAe6tx/SsWeD//o2/Ab6IH3/h25pOAAAAAElFTkSuQmCC';
var fileIcon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAINSURBVBgZBcG/r55zGAfg6/4+z3va01NHlYgzEfE7MdCIGISFgS4Gk8ViYyM2Mdlsko4GSf8Do0FLRCIkghhYJA3aVBtEz3nP89wf11VJvPDepdd390+8Nso5nESBQoq0pfvXm9fzWf19453LF85vASqJlz748vInb517dIw6EyYBIIG49u+xi9/c9MdvR//99MPPZ7+4cP4IZhhTPbwzT2d+vGoaVRRp1rRliVvHq+cfvM3TD82+7mun0o/ceO7NT+/4/KOXjwZU1ekk0840bAZzMQ2mooqh0A72d5x/6sB9D5zYnff3PoYBoWBgFKPKqDKqjCpjKr//dcu9p489dra88cydps30KswACfNEKanSaxhlntjJ8Mv12Paie+vZ+0+oeSwwQ0Iw1xAR1CiFNJkGO4wu3ZMY1AAzBI0qSgmCNJsJUEOtJSMaCTBDLyQ0CknAGOgyTyFFiLI2awMzdEcSQgSAAKVUmAeNkxvWJWCGtVlDmgYQ0GFtgg4pNtOwbBcwQy/Rife/2yrRRVI0qYCEBly8Z+P4qMEMy7JaVw72N568e+iwhrXoECQkfH91kY7jwwXMsBx1L93ZruqrK6uuiAIdSnTIKKPLPFcvay8ww/Hh+ufeznTXu49v95IMoQG3784gYXdTqvRmqn/Wpa/ADFX58MW3L71SVU9ETgEIQQQIOOzub+fhIvwPRDgeVjWDahIAAAAASUVORK5CYII=';

var mimes = {
  "txt": "text/plain",
  "html": "text/html",
  "htm": "text/html",
  "css": "text/css",
  "js": "text/javascript",
  "jpeg": "image/jpeg",
  "jpg": "image/jpeg",
  "png": "image/png",
  "gif": "image/gif",
  "svg": "image/svg+xml"
};

var extension = function (path) {
  var parts = path.split(".");
  return parts[parts.length - 1];
};

var log = function (req) {
  console.log([
    req.method,
    req.url,
    (new Date).toJSON()
  ].join(" "));
};

var renderIndex = function (req, res, pathname, dir) {
  res.writeHeader(200, {
    "Content-Type": "text/html"
  });

  res.writeLine([
    '<!DOCTYPE html>\n',
    '<html>',
    '<head>',
    '<meta charset="UTF-8">',
    '<title>Index of: ' + pathname + '</title>',
    '<style type="text/css">',
    'body {',
    '  font-family: arial, sans-serif;',
    '  font-size: 90%;',
    '  width: 850px; margin:20px auto;',
    '}',
    'p, hr {',
    '  margin: 0 0 4px 0; font-size: 90%;',
    '}',
    'h1{font-weight: normal; margin:0; padding: 10px 0 5px 0}',
    'a:link, a:visited { color: #275AB3; }',
    'ul {list-style: none outside; margin:0; padding:5px 0 20px 0}',
    'li {margin: 3px 0;}',
    '.folder { background: url(' + folderIcon + ') no-repeat; padding-left: 19px; }',
    '.file { background: url(' + fileIcon + ') no-repeat; padding-left: 19px; }',
    'img {vertical-align: middle; margin-right:4px}',
    '</style>',
    '</head>',
    '<body>',
  ].join("\n"));

  res.writeLine("<h1>Index of: " + pathname + "</h1>");

  fs.readdir(dir, function (err, files) {
    files = files.map(function (file) {
      return {
        stat: fs.statSync(path.join(dir, file)),
        name: file
      };
    });

    files = files.sort(function (a, b) {
      if (a.stat.isDirectory() && b.stat.isFile()) return -1;
      if (a.stat.isFile() && b.stat.isDirectory()) return 1;
      if (a.name < b.name) return -1;
      if (a.name > b.name) return 1;
      return 0;
    });

    res.writeLine("<ul>");

    if (pathname !== "/") {
      res.writeLine('    <li class="folder"><a href="..">..</a></li>');
    }

    files.forEach(function (file) {
      if (file.stat.isDirectory()) {
        res.writeLine('    <li class="folder"><a href="' + pathname + encodeURIComponent(file.name) + '/">' + file.name + '/</a></li>');
      } else {
        res.writeLine('    <li class="file"><a href="' + pathname + encodeURIComponent(file.name) + '">' + file.name + '</a></li>');
      }
    });
    res.writeLine("</ul>");

    res.writeLine([
      '<hr>',
      '<p style="text-align:right;">powered by <a href="http://nodejs.org">node.js</a></p>',
      '</body>',
      '</html>'
    ].join("\n"));

    res.end();
  });
};

var redirectToIndex = function (req, res, path) {
  console.log(path);
  res.writeHeader(301, {
    "Location": path + "/"
  })
  res.end();
};

var main = function () {
  var server = http.createServer(function (req, res) {
    res.writeLine = function (line) {
      this.write(line + "\n");
    };

    log(req);

    var pathname = decodeURIComponent(req.url.split("?")[0]);
    var file = path.join(dir, pathname);

    if (pathname[pathname.length - 1] === "/") {
      renderIndex(req, res, pathname, file);
      return;
    }

    fs.exists(file, function (yes) {
      if (yes) {
        fs.stat(file, function (err, stat) {
          if (stat.isDirectory()) {
            redirectToIndex(req, res, pathname);
          } else {
            serveFile(req, res, file);
          }
        });
      } else {
        show404(req, res);
      }
    });
  });

  server.listen(PORT);

  console.log("Server running at http://localhost:" + PORT + "/");
};

var findContentType = function (path) {
  var ext = extension(path);

  if (ext in mimes) {
    return mimes[ext];
  } else {
    return "application/octet-stream";
  }
};

var serveFile = function (req, res, file) {
  var contentType = findContentType(file);

  res.writeHeader(200, {
    "Content-Type": contentType
  });

  fs.readFile(file, function (err, data) {
    if (err) {
      console.log(err);
    }

    res.write(data);
    res.end();
  });
};

var show404 = function (req, res) {
  res.writeHeader(404, {
    "Content-Type": "text/html"
  });
  res.write("<h1>File Not Found</h1>");
  res.end();
};

main ();
