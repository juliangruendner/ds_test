# Load opal and datashield libraries
library(opal)
library(opaladmin)
library(dsBaseClient)

# login details
queueHost=Sys.getenv("QUEUE_HOST")
server <- c("datashield_opal")
# note the datashield_opal only works from inside this docker container
url <- c(queueHost)

# ^^^ Note this specifies the port number
user <- "test"
password <- "test123"
table <- c("test.LifeLines")
logindata <- data.frame(server,url,user,password,table)

tryCatch(
        {
            message(paste("\n\n###  Begin connecting to DataSHIELD Queue Server with host: ", queueHost, " ###\n\n"))

            opals <- datashield.login(logins=logindata, assign = TRUE)
            mean <- ds.mean(x = 'D$GEWICHT', type = "combine", datasources = opals)
            datashield.logout(opals)

            if(mean[[1]][1] == "76.1964569009275"){
                message("\n\nSUCCESS: Congratulations a mean has been succesfully calculated on test data using your DataSHIELD infrastructure\n\n")
            }else {
                message("\n\nERROR: The basic mean calculation using DataSHIELD failed, please check if your servers are all correctly set up!!!\n\n")
            }
        },
        error=function(cond) {
            message(cond)
            message("\n\nERROR: The basic mean calculation using DataSHIELD failed, please check if your servers are all correctly set up!!!\n\n")
        }
    ) 