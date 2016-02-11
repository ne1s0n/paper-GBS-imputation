df = read.csv('medie.csv')

# [1] beagle unphased           beagle unphased (shuffle) kNNI                     
# [4] MNI                       RFI_pvariables            SVD                      
# [7] fillin                    fillin (shuffle)   
# 
# alfalfa    rice       rice_chrom

res = NULL
for (p in unique(df$population)){
for (a in unique(df$algorithm)){
 res = rbind(res, data.frame(
   pop = p,
   alg = a,
   tot = mean(subset(df, population == p & algorithm == a)$totAccuracy),
   min = mean(subset(df, population == p & algorithm == a)$minHom),
   maj = mean(subset(df, population == p & algorithm == a)$majHom),
   het = mean(subset(df, population == p & algorithm == a)$hetAcc)
   
   
 ))
}}

write.csv(x = res, file='compact_res.csv', row.names = FALSE)

mean(subset(df, population == 'rice_chrom')$majHom)
mean(subset(df, population == 'rice')$majHom)

mean(subset(df, population == 'rice_chrom')$minHom)
mean(subset(df, population == 'rice')$minHom)

mean(subset(df, population == 'rice_chrom')$totAccuracy)
mean(subset(df, population == 'rice')$totAccuracy)
