#library(EBImage)
#library(reshape2)

#nuc = readImage(system.file("images", "nuclei.tif", package="EBImage"))
nuc_file      <- file.path("images", "ebi_image", "nuclei.tif")
nuc1_file_out <- file.path("data", "ebi_image", "nuc1.tsv")
nuc2_file_out <- file.path("data", "ebi_image", "nuc2.tsv")
nuc3_file_out <- file.path("data", "ebi_image", "nuc3.tsv")
nuc4_file_out <- file.path("data", "ebi_image", "nuc4.tsv")

nuc = EBImage::readImage(nuc_file)
#display(nuc, method = "raster", all = TRUE)

image1 <- EBImage::imageData(nuc)[ , ,1]
image2 <- EBImage::imageData(nuc)[ , ,2]
image3 <- EBImage::imageData(nuc)[ , ,3]
image4 <- EBImage::imageData(nuc)[ , ,4]

nuc1 <- reshape2::melt(image1)
nuc2 <- reshape2::melt(image2)
nuc3 <- reshape2::melt(image3)
nuc4 <- reshape2::melt(image4)

sample1 <- rep("sample1", nrow(nuc1))
sample2 <- rep("sample2", nrow(nuc2))
sample3 <- rep("sample3", nrow(nuc3))
sample4 <- rep("sample4", nrow(nuc4))

nuc1 <- cbind(nuc1,sample1)
nuc2 <- cbind(nuc2,sample2)
nuc3 <- cbind(nuc3,sample3)
nuc4 <- cbind(nuc4,sample4)

colnames(nuc1) <- c("x", "y", "value", "sample")
colnames(nuc2) <- c("x", "y", "value", "sample")
colnames(nuc3) <- c("x", "y", "value", "sample")
colnames(nuc4) <- c("x", "y", "value", "sample")


write.table(x=nuc1, file = nuc1_file_out, sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc2, file = nuc2_file_out, sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc3, file = nuc3_file_out, sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc4, file = nuc4_file_out, sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
