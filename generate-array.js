const fs = require("fs");
const path = require("path");

// Get the directory path from the command line arguments
const directoryPath = process.argv[2];

fs.readdir(directoryPath, function (err, files) {
  if (err) {
    return console.log("Unable to scan directory: " + err);
  }

  const array = files.map((file) => {
    return {
      image: path.join(directoryPath, file),
      name: file.replace(/-/g, " ").split(".")[0],
      location: "",
    };
  });

  console.log(array);
});
