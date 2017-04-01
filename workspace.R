library(EBImage)
library(reshape2)

nuc = readImage(system.file("images", "nuclei.tif", package="EBImage"))
display(nuc, method = "raster", all = TRUE)
image1 <- imageData(nuc)[1:510,1:510,1]
image2 <- imageData(nuc)[1:510,1:510,2]
image3 <- imageData(nuc)[1:510,1:510,3]
image4 <- imageData(nuc)[1:510,1:510,4]
nuc1 <- melt(image1)
nuc2 <- melt(image2)
nuc3 <- melt(image3)
nuc4 <- melt(image4)

sample1 <- rep("sample1",510*510)
sample2 <- rep("sample2",510*510)
sample3 <- rep("sample3",510*510)
sample4 <- rep("sample4",510*510)

nuc1 <- cbind(nuc1,sample1)
nuc2 <- cbind(nuc2,sample2)
nuc3 <- cbind(nuc3,sample3)
nuc4 <- cbind(nuc4,sample4)

colnames(nuc1) <- c("x", "y", "value", "sample")
colnames(nuc2) <- c("x", "y", "value", "sample")
colnames(nuc3) <- c("x", "y", "value", "sample")
colnames(nuc4) <- c("x", "y", "value", "sample")

write.table(x=nuc1, file ="nuc1.tsv", sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc2, file ="nuc2.tsv", sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc3, file ="nuc3.tsv", sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
write.table(x=nuc4, file ="nuc4.tsv", sep ="\t", col.names = TRUE, row.names = FALSE, quote = FALSE)
