(function(){"use strict";var e=require("crypto"),n=require("base64url"),i=require("fs"),r=Date.now(),t=n(e.randomBytes(64));i.appendFile("./config/app.js","\n//UNIX="+r+"\n//APP_KEY="+t,function(e){if(e)throw e}),i.appendFile(".env","\n#UNIX="+r+"\n#APP_KEY="+t,function(e){if(e)throw e;process.exit(0)})}).call(this);

//UNIX=1641785212230
//APP_KEY=iWz7HfVPGhnzl-pmP6dUSPKES3zQ-g-E3FjzKyuTtM0eJ7rRM6MVD92JAw6hlLIKQ5pVYDanBb37k6SL8JF3yQ
//UNIX=1641814399200
//APP_KEY=h3vQBfH0w6O2U7qrpYJdSrhNh-tq1WHl-LP9_zOeHiYhwJ5uuldGkSfRqnWDgRiSeUJloiBjy9IF6YGAK2ImlQ