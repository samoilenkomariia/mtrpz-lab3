import axios from 'axios';
import chalk from 'chalk';

const [,, from, to] = process.argv;

if (!from || !to) {
  console.log(chalk.red('using: node index.js USD EUR'));
  process.exit(1);
}

const API_URL = `https://open.er-api.com/v6/latest/${from.toUpperCase()}`;


axios.get(API_URL)
  .then(response => {
    const rate = response.data.rates[to.toUpperCase()];
    if (rate) {
      console.log(chalk.green(`1 ${from.toUpperCase()} = ${rate} ${to.toUpperCase()}`));
    } else {
      console.log(chalk.red('invalid currency'));
    }
  })
  .catch((error) => {
    console.log(chalk.red('error while requesting API'));
    console.error(error.message);
  });
