% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{LOGtoGPS}
\alias{LOGtoGPS}
\title{Recover position data from Globe .log file}
\usage{
LOGtoGPS(
  VESSEL = NA,
  CRUISE = NA,
  HAUL = NA,
  DATE = NA,
  path_in = NA,
  path_out = "./",
  filename_add = "",
  quiet = FALSE
)
}
\arguments{
\item{VESSEL}{Optional. Default = NA. The vessel number (e.g., 94). If NA or not called in the function, a prompt will appear asking for this data.}

\item{CRUISE}{Optional. Default = NA. The cruise number, which is usually the year date (e.g., 201901). If NA or not called in the function, a prompt will appear asking for this data.}

\item{HAUL}{Optional. Default = NA. The haul number, aka the iterative number of this haul (e.g., 3). If NA or not called in the function, a prompt will appear asking for this data.}

\item{DATE}{Optional. Default = NA. The date in MM/DD/YYYY format (e.g., "06/02/2019"). If NA or not called in the function, a prompt will appear asking for this data.}

\item{path_in}{Optional. Default = "./., or the local working directory but any path (as a string) may be entered.}

\item{path_out}{Optional. The default is the local working directory but may be specified with a string.}

\item{filename_add}{Optional. Default = "new". This string will be added to the name of the outputted file. Here, you can additional information that may make this file helpful to find later.}

\item{quiet}{Optional logical TRUE/FALSE. Default = FALSE. If FALSE, will print a statement or a pop-up window will let the user know where the file has been saved to.}
}
\value{
A .GPS file to the path_out directory.
}
\description{
In the event that the MARPORT server GPS fails or is incomplete, "LOGtoGPS()" converts GLOBE LOG files into a format that can be uploaded into WHEELHOUSE.
To get a .log file that is usable in this function,
\enumerate{
\item Go the C:\ globe\ logs\ 2018\ directory and choose GLG file with proper date
\item Use GLOBE Files>Logs> to convert .GLG (binary) to a .LOG (.csv) file
\item LOGtoGPS()will prompt you for Vessel code, Cruise no., Haul no. and Date
\item The final prompt will ask for the location of the GLOBE LOG file
\item LOGtoGPS()will create csv file in the R directory with filename "new.gps"
\item Rename "new.gps" to HAULXXXX.GPS where XXXX is the haul number
\item Upload HAULXXXX.GPS into WHEELHOUSE
\item NOTE: The raw GLOBE log data are in GMT time (-8 hrs or 4PM AKDT prior day to 4PM current day. Hence if haul with missing GPS spans the 4PM hour (e.g.,3:45-4:30 PM),YOU WILL HAVE TO CONVERT TWO GLG files (current day and next day)and run LOGtoGPS()twice & manually combine the two GPS files
\item ALSO NOTE: You may have to shut down GLOBE or wait until after 4pm on following day before all the incoming NMEA data are written to the GLG file.
}
}
\details{
Now that you have a .log file, you can RUN the function by putting your cursor on the "LOGtoGPS()" line below & press CTRL+R.
}
\examples{
LOGtoGPS(
    VESSEL = 94,
    CRUISE = 201901,
    HAUL = 3,
    DATE = "06/06/2017",
    path_in = system.file("exdata/log2gps/06062017.log", 
        package = "GAPsurvey"),
    path_out = getwd(),
    filename_add = "newlog",
    quiet = TRUE)
    
    LOGtoGPS(
    VESSEL = 94,
    CRUISE = 202101,
    HAUL = 37,
    DATE = "06/07/2021",
    path_in = system.file("exdata/log2gps/Haul0037.log", 
        package = "GAPsurvey"),
    path_out = getwd(),
    filename_add = "newlog",
    quiet = TRUE)
}
