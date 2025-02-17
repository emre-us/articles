install.packages(c("readxl", "zoo", "xts", "tseries", "devtools", "ConnectednessApproach", "knitr"))
# Load necessary libraries
library(readxl)
library(zoo)
library(xts)
library(tseries)
library(devtools)
library(ConnectednessApproach)
library(knitr)

# Load your data
dfrvfc <- EUR.daily.rtn_dec  # Replace Eur.daily.rtn with your data frame
datarvfc <- xts(dfrvfc[,-1], order.by = as.Date(dfrvfc[,1], "%m/%d/%Y"))

# Define parameters for looping
nfore_values <- c(8, 10, 12)        # Forecast horizons
window_sizes <- c(180, 200, 220)    # Rolling window sizes

# Create a directory to save all results
if (!dir.exists("results_vol")) {
  dir.create("results_vol")
}

# Loop through all parameter combinations
counter <- 1
for (nfore in nfore_values) {
  for (window in window_sizes) {
    
    # Print progress message
    cat(paste0("\nRunning: nfore = ", nfore, ", window.size = ", window, "...\n"))
    
    # Run the ConnectednessApproach function
    dcarvfc <- ConnectednessApproach(datarvfc, nlag = 4, nfore = nfore, window.size = window)
    
    # Create a folder for this parameter combination
    folder_name <- paste0("results_vol/nfore_", nfore, "_window_", window)
    if (!dir.exists(folder_name)) dir.create(folder_name)
    
    # Save the results table as a CSV file
    write.csv(dcarvfc$TABLE, file = paste0(folder_name, "/TABLE.csv"), row.names = FALSE)
    
    # Save all the plots as PNG files
    png(filename = paste0(folder_name, "/PlotTCI.png"), width = 800, height = 600)
    PlotTCI(dcarvfc, ylim = c(0, 80))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotTO.png"), width = 800, height = 600)
    PlotTO(dcarvfc, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotFROM.png"), width = 800, height = 600)
    PlotFROM(dcarvfc, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNET.png"), width = 800, height = 600)
    PlotNET(dcarvfc, ylim = c(-42, 42))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNPDC.png"), width = 800, height = 600)
    PlotNPDC(dcarvf, ylim = c(-30, 30))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotPCI.png"), width = 800, height = 600)
    PlotPCI(dcarvfc)
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNPT.png"), width = 800, height = 600)
    PlotNPT(dcarvfc)
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotINF.png"), width = 800, height = 600)
    PlotINF(dcarvfc, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNetwork_NPDC.png"), width = 800, height = 600)
    PlotNetwork(dcarvfc, method = "NPDC")
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNetwork_PCI.png"), width = 800, height = 600)
    PlotNetwork(dcarvfc, method = "PCI")
    dev.off()
    
    # Print completion message for the current iteration
    cat(paste0("Completed: nfore = ", nfore, ", window.size = ", window, "\n"))
    counter <- counter + 1
  }
}
cat("All tests completed successfully! Results are saved in the 'results_vol' folder.\n")

getwd()

#Volatility Analysis

# Load your data
dfrvfcv <- EUR.daily.std_dec  # Replace Eur.daily.rtn with your data frame
datarvfcv <- xts(dfrvfcv[,-1], order.by = as.Date(dfrvfcv[,1], "%m/%d/%Y"))

# Define parameters for looping
nfore_values <- c(8, 10, 12)        # Forecast horizons
window_sizes <- c(180, 200, 220)    # Rolling window sizes

# Create a directory to save all results
if (!dir.exists("results_vol1")) {
  dir.create("results_vol1")
}

# Loop through all parameter combinations
counter <- 1
for (nfore in nfore_values) {
  for (window in window_sizes) {
    
    # Print progress message
    cat(paste0("\nRunning: nfore = ", nfore, ", window.size = ", window, "...\n"))
    
    # Run the ConnectednessApproach function
    dcarvfcv <- ConnectednessApproach(datarvfcv, nlag = 4, nfore = nfore, window.size = window)
    
    # Create a folder for this parameter combination
    folder_name <- paste0("results_vol1/nfore_", nfore, "_window_", window)
    if (!dir.exists(folder_name)) dir.create(folder_name)
    
    # Save the results table as a CSV file
    write.csv(dcarvfcv$TABLE, file = paste0(folder_name, "/TABLE.csv"), row.names = FALSE)
    
    # Save all the plots as PNG files
    png(filename = paste0(folder_name, "/PlotTCI.png"), width = 800, height = 600)
    PlotTCI(dcarvfcv, ylim = c(0, 80))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotTO.png"), width = 800, height = 600)
    PlotTO(dcarvfcv, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotFROM.png"), width = 800, height = 600)
    PlotFROM(dcarvfcv, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNET.png"), width = 800, height = 600)
    PlotNET(dcarvfcv, ylim = c(-42, 42))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNPDC.png"), width = 800, height = 600)
    PlotNPDC(dcarvfcv, ylim = c(-30, 30))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotPCI.png"), width = 800, height = 600)
    PlotPCI(dcarvfcv)
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNPT.png"), width = 800, height = 600)
    PlotNPT(dcarvfcv)
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotINF.png"), width = 800, height = 600)
    PlotINF(dcarvfcv, ylim = c(0, 100))
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNetwork_NPDC.png"), width = 800, height = 600)
    PlotNetwork(dcarvfcv, method = "NPDC")
    dev.off()
    
    png(filename = paste0(folder_name, "/PlotNetwork_PCI.png"), width = 800, height = 600)
    PlotNetwork(dcarvfcv, method = "PCI")
    dev.off()
    
    # Print completion message for the current iteration
    cat(paste0("Completed: nfore = ", nfore, ", window.size = ", window, "\n"))
    counter <- counter + 1
  }
}
cat("All tests completed successfully! Results are saved in the 'results_vol1' folder.\n")

getwd()
