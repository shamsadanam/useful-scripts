const fs = require('fs');
const path = require('path');

// Get the directory path from the command line arguments
const directoryPath = process.argv[2];

fs.readdir(directoryPath, (err, files) => {
  if (err) {
    return console.log("Unable to scan directory: " + err);
  }

  // Get metadata for each file
  const filesWithStats = files.map(file => {
    const filePath = path.join(directoryPath, file);
    const stats = fs.statSync(filePath);
    return {
      file: file,
      filePath: filePath,
      modifiedTime: stats.mtime
    };
  });

  // Sort files by modified time
  filesWithStats.sort((a, b) => a.modifiedTime - b.modifiedTime);

  // Create the array in the desired format
  const array = filesWithStats.map((fileWithStats, index) => ({
    image: fileWithStats.filePath,
    name: fileWithStats.file.replace(/-/g, " ").split(".")[0],
    order: index
  }));

  console.log(array);
});
