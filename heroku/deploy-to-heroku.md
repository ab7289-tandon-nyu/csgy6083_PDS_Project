#### Steps to Deploy application to Heroku

# Set up heroku account.
Make sure you can log into your heroku acount.
If heroku api key has expired, generate a new dev one with `heroku auth:token -a <heroku-app-name>`
Copy that token into your repo's Github secrets so you can call if from WF with `${{ secrets.HEROKU_API_KEY }}`

# Push app to Heroku container registry

Navigate to the `/app` folder.
log into heroku cli with

`heroku container:login`

From the folder where the application Dockerfile is, run

`heroku container:push web -a <heroku-app-name>`

To build and push the container to your application.
Finally release the application:

`heroku container:release web -a <heroku-app-name>`


# Set Database config

When using the ClearDB MYSQL Database addon, need to copy the database name, host name, user name,
and password. These need to go into your heroku config vars. Also need to update database init scripts
so that they have the right database name (since we're only allowed to create/modify that one).

Once DB scripts--DDL and DML--have been updated with the info from ClearDB, use the heroku CLI to run
the DDL script.

`heroku run mysql --user=<db_username> --host=<db_hostname> --password=<db_passsword> --reconnect <db_name> < db/heroku_init_scripts/create_db.sql`

Then, log into the database using mysqlworkbench, and run the DML script.

Then you should be good to go!
