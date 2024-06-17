const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const { log } = require('console');

// Tailwind colors to Flutter color
// node --watch ./script/buidColor.js --${color}

const regex = /([^#\n]+)/g;
const color = process.argv[process.argv.length - 1].slice(2);

function isOdd(num) {
  return num % 2 !== 0;
}

fs.readFile(`./script/temp.txt`, 'utf8', (err, data) => {
  if (data.includes('Processed')) {
    console.log('Processed');
    return;
  }

  const match = data.match(regex).map((item) => item.toLocaleUpperCase());
  const resultArray = [];

  for (let i = 0; i < match.length; i++) {
    if (isOdd(i)) continue;

    const cur = match[i];
    const str = `static const Color ${color}${cur} = Color(0xFF${
      match[i + 1]
    });`;

    resultArray.push(str);
  }

  const result = `\n\n---------\n${resultArray.join(
    '\n'
  )}\n--------- Processed\n`;

  fs.appendFile('./script/temp.txt', result, (data, err) => {
    if (err) {
      console.log(`error: ${err}`);
    } else {
      console.log('success');
    }
  });
});
