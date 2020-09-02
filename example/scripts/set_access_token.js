const fs = require('fs');
const path = require('path');

const accessToken = "";

if (!accessToken) {
  process.exit(1);
}

// eslint-disable-next-line no-new-wrappers
const fileContents = `{ "accessToken": "${new String(accessToken).trim()}" }`;
fs.writeFileSync(path.join('./', 'env.json'), fileContents);
