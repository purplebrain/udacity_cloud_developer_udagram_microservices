import cors from 'cors';
import express from 'express';
import {sequelize} from './sequelize'; 

import {IndexRouter} from './controllers/v0/index.router';

import bodyParser from 'body-parser';
import {config} from './config/config';
import {V0_USER_MODELS} from './controllers/v0/model.index';


(async () => {
  //await sequelize.addModels(V0_FEED_MODELS);
  await sequelize.addModels(V0_USER_MODELS);
  await sequelize.sync();

  const app = express();
  const port = process.env.PORT || 8082;

  app.use(bodyParser.json());

  app.use(cors({
    allowedHeaders: [
      'Origin', 'X-Requested-With',
      'Content-Type', 'Accept',
      'X-Access-Token', 'Authorization',
    ],
    methods: 'GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE',
    origin: "*"
  }));

  app.use('/api/v0/users/', IndexRouter);

  // Root URI call
  app.get( '/', async ( req, res ) => {
    res.send( '/api/v0/users' );
  } );


  // Start the Server
  app.listen( port, () => {
    console.log( `server running ${config.url}` );
    console.log( `ENVIRONMENT VARIABLES` );
    console.log( `AWS_ACCESS_KEY_ID : ${process.env.AWS_ACCESS_KEY_ID}` );
    console.log( `AWS_SECRET_ACCESS_KEY : ${process.env.AWS_SECRET_ACCESS_KEY}` );
    console.log( `AWS_REGION : ${config.aws_region}` );
    console.log( `AWS_PROFILE : ${config.aws_profile}` );
    console.log( `AWS_MEDIA_BUCKET : ${config.aws_media_bucket}` );
    console.log( `POSTGRES_USERNAME : ${config.username}` );
    console.log( `POSTGRES_PASSWORD : ${config.password}` );
    console.log( `POSTGRES_DB : ${config.database}` );
    console.log( `POSTGRES_HOST : ${config.host}` );
    console.log( `PORT : ${port}` );
    console.log( `press CTRL+C to stop server` );
  } );
})();
