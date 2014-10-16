# IDs, counts, and doc ids to use for verification in querying
MANUAL_ANNOTATION_XXHASH = [1041899727, 1116757309, 1118768622, 1132799958, 1276288551, 1278301126, 1294955310, 1367038899, 1397464604, 1429265218, 1436188383, 1457559688, 1564120855, 1648354265, 1737724267, 1775001483, 1815619048, 1845933306, 1855054362, 1891098225, 1897602846, 1900980300, 1911650997, 1941539371, 1960287610, 1968696234, 2015319689, 2158142354, 2169457277, 2172433442, 2223595865, 2265630877, 2277609132, 2342909499, 2471850823, 2492339354, 2561651131, 2588010934, 2634609409, 2659771975, 2719637631, 2979941855, 301104715, 3061354475, 3111427210, 3131668133, 3174080258, 3186034290, 3189822825, 3224726537, 33311642, 3382211325, 3478116066, 3479363986, 3578505328, 3585924929, 3605434666, 3616942866, 3666208680, 370498697, 3770678017, 3887744824, 3927646680, 3981139458, 3984609496, 4052308340, 4150125671, 4174731843, 499876719, 528574762, 638074822, 66776817, 689454552, 69952072, 744587962, 868280579, 93341366, 934852592]
MANUAL_ANNOTATION_COUNTS = {1041899727=>1, 1116757309=>1, 1118768622=>1, 1132799958=>1, 1276288551=>1, 1278301126=>2, 1294955310=>1, 1367038899=>1, 1397464604=>21, 1429265218=>1, 1436188383=>19, 1457559688=>1, 1564120855=>6, 1648354265=>2, 1737724267=>1, 1775001483=>18, 1815619048=>1, 1845933306=>1, 1855054362=>1, 1891098225=>1, 1897602846=>7, 1900980300=>3, 1911650997=>14, 1941539371=>1, 1960287610=>1, 1968696234=>327, 2015319689=>1, 2158142354=>1, 2169457277=>1, 2172433442=>1, 2223595865=>4, 2265630877=>1, 2277609132=>1, 2342909499=>1, 2471850823=>143, 2492339354=>3, 2561651131=>1, 2588010934=>1, 2634609409=>1, 2659771975=>1, 2719637631=>2, 2979941855=>4, 301104715=>1, 3061354475=>1, 3111427210=>1, 3131668133=>47, 3174080258=>189, 3186034290=>3, 3189822825=>1, 3224726537=>1, 33311642=>1, 3382211325=>1, 3478116066=>4, 3479363986=>3, 3578505328=>1, 3585924929=>2, 3605434666=>3, 3616942866=>1, 3666208680=>1, 370498697=>1, 3770678017=>8, 3887744824=>1, 3927646680=>1, 3981139458=>1, 3984609496=>1, 4052308340=>1, 4150125671=>1, 4174731843=>19, 499876719=>1, 528574762=>1, 638074822=>2, 66776817=>3, 689454552=>1, 69952072=>1, 744587962=>1, 868280579=>1, 93341366=>2, 934852592=>1}

# The inserts in this file use UNION SELECT because earlier versions of SQLite don't support VALUE inserts
# Don't revert this change unless you are sure your test env supports newer SQLite versions (Jruby 1.7.12 does not, for example)

ONTOLOGIES_TABLE = <<-EOS
INSERT INTO 'obs_ontology'
  SELECT 1318 AS 'id', '47845' AS 'local_ontology_id', 'NCBI organismal classification' AS 'name', '1.2' AS 'version', '' AS 'description', 28 AS 'status', '1132' AS 'virtual_ontology_id', 'OWL' AS 'format', 21 AS 'dictionary_id'
EOS

CONCEPTS_TABLE = <<-EOS
INSERT INTO 'obs_concept'
  SELECT 38776185 AS 'id', '47845/obo:NCBITaxon_10090' AS 'local_concept_id', 1318 AS 'ontology_id', 0 AS 'is_toplevel', 'http://purl.obolibrary.org/obo/NCBITaxon_10090' AS 'full_id'
  UNION SELECT 38778061, '47845/obo:NCBITaxon_10116', 1318, 0, 'http://purl.obolibrary.org/obo/NCBITaxon_10116'
  UNION SELECT 38869745, '47845/obo:NCBITaxon_119951', 1318, 0, 'http://purl.obolibrary.org/obo/NCBITaxon_119951'
  UNION SELECT 38878148, '47845/obo:NCBITaxon_128735', 1318, 0, 'http://purl.obolibrary.org/obo/NCBITaxon_128735'
  UNION SELECT 38906355, '47845/obo:NCBITaxon_1590', 1318, 0, 'http://purl.obolibrary.org/obo/NCBITaxon_1590'
EOS

RESOURCES_TEST_DATA = <<-EOS
INSERT INTO 'obr_resource'
  SELECT 1 AS 'id', 'ArrayExpress' AS 'name', 'AE' AS 'resource_id', '<obs.obr.populate.Structure>\n  <resourceId>AE</resourceId>\n  <contexts>\n    <entry>\n      <string>AE_name</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>AE_description</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>AE_species</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>AE_experiment_type</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>name</string>\n    <string>description</string>\n    <string>species</string>\n    <string>experiment_type</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>AE_name</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>AE_description</string>\n      <double>0.8</double>\n    </entry>\n    <entry>\n      <string>AE_species</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>AE_experiment_type</string>\n      <double>0.9</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>AE_name</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>AE_description</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>AE_species</string>\n      <string>1132</string>\n    </entry>\n    <entry>\n      <string>AE_experiment_type</string>\n      <string>1136</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>' AS 'structure', 'AE_name' AS 'main_context', 'http://www.ebi.ac.uk/arrayexpress/' AS 'url', 'http://www.ebi.ac.uk/arrayexpress/experiments/' AS 'element_url', 'ArrayExpress is a public repository for microarray data, which is aimed at storing MIAME-compliant data in accordance with MGED recommendations. The ArrayExpress Data Warehouse stores gene-indexed expression profiles from a curated subset of experiments in the repository.' AS 'description', 'http://www.ebi.ac.uk/microarray-as/aer/include/aelogo.png' AS 'logo', 23 AS 'dictionary_id', 35877 AS 'total_element', '2013-02-05 21:35:46' AS 'last_update_date', '2013-09-26 05:13:05' AS 'workflow_completed_date'
  UNION SELECT 2, 'ClinicalTrials.gov', 'CT', '<obs.obr.populate.Structure>\n  <resourceId>CT</resourceId>\n  <contexts>\n    <entry>\n      <string>CT_intervention</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CT_official_title</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CT_brief_summary</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CT_condition</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CT_brief_title</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CT_detailed_description</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>brief_title</string>\n    <string>official_title</string>\n    <string>brief_summary</string>\n    <string>detailed_description</string>\n    <string>condition</string>\n    <string>intervention</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>CT_intervention</string>\n      <double>0.6</double>\n    </entry>\n    <entry>\n      <string>CT_official_title</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>CT_brief_summary</string>\n      <double>0.8</double>\n    </entry>\n    <entry>\n      <string>CT_condition</string>\n      <double>0.6</double>\n    </entry>\n    <entry>\n      <string>CT_brief_title</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>CT_detailed_description</string>\n      <double>0.7</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>CT_intervention</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CT_official_title</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CT_brief_summary</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CT_condition</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CT_brief_title</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CT_detailed_description</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'CT_brief_title', 'http://clinicaltrials.gov/', 'http://clinicaltrials.gov/ct/show/', 'ClinicalTrials.gov provides regularly updated information about federally and privately supported clinical research in human volunteers. ClinicalTrials.gov gives you information about a trial''s purpose, who may participate, locations, and phone numbers for more details. The information provided on ClinicalTrials.gov should be used in conjunction with advice from health care professionals. Before searching, you may want to learn more about clinical trials.', 'http://clinicaltrials.gov/ct2/html/images/frame/title.gif', 23, 122591, '2012-03-08 21:00:13', '2013-10-02 07:18:39'
  UNION SELECT 3, 'ARRS GoldMiner', 'GM', '<obs.obr.populate.Structure>\n  <resourceId>GM</resourceId>\n  <contexts>\n    <entry>\n      <string>GM_caption</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>GM_title</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>title</string>\n    <string>caption</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>GM_caption</string>\n      <double>0.8</double>\n    </entry>\n    <entry>\n      <string>GM_title</string>\n      <double>1.0</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>GM_caption</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>GM_title</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'GM_title', 'http://goldminer.arrs.org/', 'http://goldminer.arrs.org/link.php?id=', 'ARRS GoldMiner provides instant access to images published in selected peer-reviewed radiology journals. This new, web-based system allows viewers to search for images by findings, anatomy, imaging technique, and patient age and sex.', 'http://goldminer.arrs.org/image/goldminer.gif', 23, 1155, '2012-03-06 05:56:19', '2013-09-30 22:08:42'
  UNION SELECT 4, 'Online Mendelian Inheritance in Man', 'OMIM', '<obs.obr.populate.Structure>\n  <resourceId>OMIM</resourceId>\n  <contexts>\n    <entry>\n      <string>OMIM_title</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>OMIM_locus</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>OMIM_uid</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>OMIM_altTitles</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>uid</string>\n    <string>title</string>\n    <string>altTitles</string>\n    <string>locus</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>OMIM_title</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>OMIM_locus</string>\n      <double>0.0</double>\n    </entry>\n    <entry>\n      <string>OMIM_uid</string>\n      <double>0.0</double>\n    </entry>\n    <entry>\n      <string>OMIM_altTitles</string>\n      <double>0.7</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>OMIM_title</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>OMIM_locus</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>OMIM_uid</string>\n      <string>-1</string>\n    </entry>\n    <entry>\n      <string>OMIM_altTitles</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'OMIM_title', 'http://www.ncbi.nlm.nih.gov/omim', 'http://www.ncbi.nlm.nih.gov/omim/', 'OMIM is a comprehensive, authoritative, and timely compendium of human genes and genetic phenotypes. The full-text, referenced overviews in OMIM contain information on all known mendelian disorders and over 12,000 genes. OMIM focuses on the relationship between phenotype and genotype.', 'http://www.ncbi.nlm.nih.gov/entrez/query/static/gifs/entrez_omim.gif', 23, 22186, '2012-03-09 03:49:31', '2013-10-23 05:30:26'
  UNION SELECT 5, 'Conserved Domain Database (CDD)', 'CDD', '<obs.obr.populate.Structure>\n  <resourceId>CDD</resourceId>\n  <contexts>\n    <entry>\n      <string>CDD_abstract</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CDD_title</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>CDD_uid</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>uid</string>\n    <string>title</string>\n    <string>abstract</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>CDD_abstract</string>\n      <double>0.6</double>\n    </entry>\n    <entry>\n      <string>CDD_title</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>CDD_uid</string>\n      <double>0.0</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>CDD_abstract</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CDD_title</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>CDD_uid</string>\n      <string>-1</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'CDD_title', 'http://www.ncbi.nlm.nih.gov/Structure/cdd/cdd.shtml', 'http://www.ncbi.nlm.nih.gov/Structure/cdd/cddsrv.cgi?uid=', 'The Conserved Domain Database (CDD) contains protein domain models imported from outside sources, such as Pfam and SMART, and curated at NCBI. CDD contains over 12,000 such models and is linked to other NCBI databases, including protein sequences, bibliographic citations, and taxonomy.', 'http://www.ncbi.nlm.nih.gov/Structure/cdd/cdd2.gif', 23, 46346, '2012-03-09 03:25:52', '2013-10-23 02:03:22'
  UNION SELECT 6, 'PharmGKB [Disease]', 'PGDI', '<obs.obr.populate.Structure>\n  <resourceId>PGDI</resourceId>\n  <contexts>\n    <entry>\n      <string>PGDI_diseaseRelatedGenes</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPathways</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPhenotypeDatasets</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseName</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedDrugs</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseAlternateNames</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>diseaseName</string>\n    <string>diseaseAlternateNames</string>\n    <string>diseaseRelatedGenes</string>\n    <string>diseaseRelatedPathways</string>\n    <string>diseaseRelatedDrugs</string>\n    <string>diseaseRelatedPhenotypeDatasets</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>PGDI_diseaseRelatedGenes</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPathways</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPhenotypeDatasets</string>\n      <double>0.4</double>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseName</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedDrugs</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseAlternateNames</string>\n      <double>0.8</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>PGDI_diseaseRelatedGenes</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPathways</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedPhenotypeDatasets</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseName</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseRelatedDrugs</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDI_diseaseAlternateNames</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'PGDI_diseaseName', 'http://www.pharmgkb.org/', 'https://www.pharmgkb.org/do/serve?objId=', 'PharmGKB curates information that establishes knowledge about the relationships among drugs, diseases and genes, including their variations and gene products.', 'https://www.pharmgkb.org/images/header/title.png', 23, 837, '2012-03-05 22:28:11', '2013-09-25 23:02:14'
  UNION SELECT 7, 'PharmGKB [Drug]', 'PGDR', '<obs.obr.populate.Structure>\n  <resourceId>PGDR</resourceId>\n  <contexts>\n    <entry>\n      <string>PGDR_drugRelatedPhenotypeDatasets</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugTradeNames</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedDiseases</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugName</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedGenes</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedPathways</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGDR_drugGenericNames</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>drugName</string>\n    <string>drugTradeNames</string>\n    <string>drugGenericNames</string>\n    <string>drugRelatedGenes</string>\n    <string>drugRelatedPathways</string>\n    <string>drugRelatedDiseases</string>\n    <string>drugRelatedPhenotypeDatasets</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>PGDR_drugRelatedPhenotypeDatasets</string>\n      <double>0.4</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugTradeNames</string>\n      <double>0.9</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedDiseases</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugName</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedGenes</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedPathways</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGDR_drugGenericNames</string>\n      <double>0.9</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>PGDR_drugRelatedPhenotypeDatasets</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugTradeNames</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedDiseases</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugName</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedGenes</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugRelatedPathways</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGDR_drugGenericNames</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'PGDR_drugName', 'http://www.pharmgkb.org/', 'https://www.pharmgkb.org/do/serve?objId=', 'PharmGKB curates information that establishes knowledge about the relationships among drugs, diseases and genes, including their variations and gene products.', 'https://www.pharmgkb.org/images/header/title.png', 23, 1643, '2012-03-05 22:28:10', '2013-09-25 22:55:30'
  UNION SELECT 8, 'PharmGKB [Gene]', 'PGGE', '<obs.obr.populate.Structure>\n  <resourceId>PGGE</resourceId>\n  <contexts>\n    <entry>\n      <string>PGGE_geneName</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneSymbol</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneAlternateSymbols</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDiseases</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPathways</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDrugs</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPhenotypeDatasets</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>geneName</string>\n    <string>geneSymbol</string>\n    <string>geneAlternateSymbols</string>\n    <string>geneRelatedDrugs</string>\n    <string>geneRelatedPathways</string>\n    <string>geneRelatedDiseases</string>\n    <string>geneRelatedPhenotypeDatasets</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>PGGE_geneName</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneSymbol</string>\n      <double>0.9</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneAlternateSymbols</string>\n      <double>0.9</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDiseases</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPathways</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDrugs</string>\n      <double>0.5</double>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPhenotypeDatasets</string>\n      <double>0.4</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>PGGE_geneName</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneSymbol</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneAlternateSymbols</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDiseases</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPathways</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedDrugs</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>PGGE_geneRelatedPhenotypeDatasets</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'PGGE_geneName', 'http://www.pharmgkb.org/', 'https://www.pharmgkb.org/do/serve?objId=', 'PharmGKB curates information that establishes knowledge about the relationships among drugs, diseases and genes, including their variations and gene products.', 'https://www.pharmgkb.org/images/header/title.png', 23, 1242, '2012-01-24 01:50:10', '2013-09-25 22:59:06'
  UNION SELECT 9, 'Reactome', 'REAC', '<obs.obr.populate.Structure>\n  <resourceId>REAC</resourceId>\n  <contexts>\n    <entry>\n      <string>REAC_goCellCompartiment</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>REAC_participants</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>REAC_goBiologicalProcess</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>REAC_name</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>name</string>\n    <string>participants</string>\n    <string>goBiologicalProcess</string>\n    <string>goCellCompartiment</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>REAC_goCellCompartiment</string>\n      <double>0.2</double>\n    </entry>\n    <entry>\n      <string>REAC_participants</string>\n      <double>0.8</double>\n    </entry>\n    <entry>\n      <string>REAC_goBiologicalProcess</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>REAC_name</string>\n      <double>1.0</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>REAC_goCellCompartiment</string>\n      <string>1070</string>\n    </entry>\n    <entry>\n      <string>REAC_participants</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>REAC_goBiologicalProcess</string>\n      <string>1070</string>\n    </entry>\n    <entry>\n      <string>REAC_name</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'REAC_name', 'http://www.reactome.org/', 'http://www.reactome.org/cgi-bin/eventbrowser?DB=gk_current&ID=', 'A curated knowledgebase of biological pathways.', 'http://www.reactome.org/icons/R-purple.png', 23, 208093, '2012-03-08 00:23:55', '2013-10-03 21:30:23'
  UNION SELECT 10, 'UniProt KB', 'UPKB', '<obs.obr.populate.Structure>\n  <resourceId>UPKB</resourceId>\n  <contexts>\n    <entry>\n      <string>UPKB_naturalVariant</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_goAnnotationList</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_geneSymbol</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_cellularComponent</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_proteinName</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_molecularFunction</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_mutagenesis</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_biologicalProcess</string>\n      <null/>\n    </entry>\n    <entry>\n      <string>UPKB_organism</string>\n      <null/>\n    </entry>\n  </contexts>\n  <itemKeys>\n    <string>geneSymbol</string>\n    <string>goAnnotationList</string>\n    <string>proteinName</string>\n    <string>organism</string>\n    <string>naturalVariant</string>\n    <string>mutagenesis</string>\n    <string>biologicalProcess</string>\n    <string>cellularComponent</string>\n    <string>molecularFunction</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>UPKB_naturalVariant</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_goAnnotationList</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>UPKB_geneSymbol</string>\n      <double>1.0</double>\n    </entry>\n    <entry>\n      <string>UPKB_cellularComponent</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_proteinName</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_molecularFunction</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_mutagenesis</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_biologicalProcess</string>\n      <double>0.7</double>\n    </entry>\n    <entry>\n      <string>UPKB_organism</string>\n      <double>0.8</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>UPKB_naturalVariant</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_goAnnotationList</string>\n      <string>1070</string>\n    </entry>\n    <entry>\n      <string>UPKB_geneSymbol</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_cellularComponent</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_proteinName</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_molecularFunction</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_mutagenesis</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_biologicalProcess</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>UPKB_organism</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'UPKB_geneSymbol', 'http://www.uniprot.org/', 'http://www.uniprot.org/uniprot/', 'The mission of UniProt is to provide the scientific community with a comprehensive, high-quality and freely accessible resource of protein sequence and functional information.', 'http://www.uniprot.org/images/logo.gif', 23, 533515, '2012-02-27 02:41:23', '2013-11-03 16:12:14'
  UNION SELECT 99, 'Wicked Witch', 'WITCH', '<obs.obr.populate.Structure>\n  <resourceId>WITCH</resourceId>\n  <contexts>\n    <entry>\n      <string>WITCH_sentence</string>\n    <null/>\n    </entry>\n    </contexts>\n  <itemKeys>\n    <string>sentence</string>\n  </itemKeys>\n  <weights>\n    <entry>\n      <string>WITCH_sentence</string>\n      <double>1.0</double>\n    </entry>\n  </weights>\n  <ontoIds>\n    <entry>\n      <string>WITCH_title</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>WITCH_keywords</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>WITCH_meshheadings</string>\n      <string>null</string>\n    </entry>\n    <entry>\n      <string>WITCH_abstract</string>\n      <string>null</string>\n    </entry>\n  </ontoIds>\n</obs.obr.populate.Structure>', 'WITCH_title', 'http://example.org', 'http://example.org', 'The wicked witch of the west is a mean lady', '', 23, 4, '2014-05-12 21:18:26', '2014-05-12 21:18:26'
EOS

DOCUMENTS_TEST_DATA_WITCH = <<-EOS
INSERT INTO `obr_witch_element`
  SELECT 1 AS 'id', '1' AS 'local_element_id', 'wicked witch of the west' AS 'WITCH_sentence'
  UNION SELECT 2, '2', 'wicked witch of the east'
  UNION SELECT 3, '3', 'wicked witch sorcerer of the west'
  UNION SELECT 4, '4', 'wicked sorcerer of the west'
EOS