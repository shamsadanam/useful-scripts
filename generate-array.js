const fs = require("fs");
const path = require("path");

const directoryPath = path.join(
  __dirname,
  "public",
  "frontend",
  "temp",
  "projects"
);
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
