#!/bin/bash

#1 a
wc ce11_genes.bed 
   
   #53935  323610 2200094 ce11_genes.bed

#1 b
grep chrI ce11_genes.bed | wc
   
   #38026 features
   #38026  228156 1559286

grep chrII ce11_genes.bed | wc

   #11148 features
   #11148   66888  460214

#1 c
grep + ce11_genes.bed | wc
   
   #27309 features for the positive strand
   #27309  163854 1114547

grep - ce11_genes.bed | wc
   
   #26626 features for the negative strand
   #26626  159756 1085547


#-------------------------------------------

#3 a
cut -f 7 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt | uniq -d | uniq -d

#Whole Blood, Heart - Left Ventricle, and Thyroid
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Heart - Left Ventricle
Thyroid
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood
Whole Blood

#3 b
grep RNA GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt | wc
   
   #20017 lines have "RNA"
   #20017 1288009 10820825

#3c
wc GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt
   
   #22952 - 20017 = 2935 do NOT have RNA
   #22952 1351453 11512258 

#---------------------------------------------------------------------

#5 a

#5 b
grep lncRNA gencode.v46.basic.annotation.gtf | wc
  #UNSURE???
  #156661 5160986 56636760
