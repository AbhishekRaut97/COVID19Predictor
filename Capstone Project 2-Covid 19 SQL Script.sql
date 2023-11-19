-- Q.1.Find the number of corona patients who faced shortness of breath.
SELECT COUNT(*) AS num_patients_with_shortness_of_breath
FROM corona
WHERE Corona = 'positive' AND Shortness_of_breath = 'True';

-- Q.2.Find the number of negative corona patients who have fever and sore_throat. 
SELECT COUNT(*) AS num_negative_patients_with_fever_and_sore_throat
FROM corona
WHERE Corona = 'negative' AND Fever = 'True' AND Sore_throat = 'True';

-- Q.3.Group the data by month and rank the number of positive cases.
SELECT MONTH(Test_date) AS test_month,
       COUNT(*) AS num_positive_cases,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM corona
WHERE Corona = 'positive'
GROUP BY test_month
ORDER BY test_month;

-- Q.4.Find the female negative corona patients who faced cough and headache.
SELECT *
FROM corona
WHERE Corona = 'negative' AND Sex = 'female' AND Cough_symptoms = 'True' AND Headache = 'True';

-- Q.5.How many elderly corona patients have faced breathing problems?
SELECT COUNT(*) AS num_elderly_patients_with_breathing_problems
FROM corona
WHERE Corona = 'positive' AND Age_60_above = 'Yes' AND Shortness_of_breath = 'True';

-- Q.6.Which three symptoms were more common among COVID positive patients?
SELECT
    symptom,
    COUNT(*) AS symptom_count
FROM (
    SELECT 'Cough_symptoms' AS symptom, Cough_symptoms FROM corona WHERE Corona = 'positive' AND Cough_symptoms = 'True'
    UNION ALL
    SELECT 'Fever' AS symptom, Fever FROM corona WHERE Corona = 'positive' AND Fever = 'True'
    UNION ALL
    SELECT 'Sore_throat' AS symptom, Sore_throat FROM corona WHERE Corona = 'positive' AND Sore_throat = 'True'
    UNION ALL
    SELECT 'Shortness_of_breath' AS symptom, Shortness_of_breath FROM corona WHERE Corona = 'positive' AND Shortness_of_breath = 'True'
    UNION ALL
    SELECT 'Headache' AS symptom, Headache FROM corona WHERE Corona = 'positive' AND Headache = 'True'
) AS symptoms_data
GROUP BY symptom
ORDER BY symptom_count DESC
LIMIT 3;

 -- Q.7.Which symptom was less common among COVID negative people?
 SELECT
    symptom,
    COUNT(*) AS symptom_count
FROM (
    SELECT 'Cough_symptoms' AS symptom, Cough_symptoms FROM corona WHERE Corona = 'negative' AND Cough_symptoms = 'True'
    UNION ALL
    SELECT 'Fever' AS symptom, Fever FROM corona WHERE Corona = 'negative' AND Fever = 'True'
    UNION ALL
    SELECT 'Sore_throat' AS symptom, Sore_throat FROM corona WHERE Corona = 'negative' AND Sore_throat = 'True'
    UNION ALL
    SELECT 'Shortness_of_breath' AS symptom, Shortness_of_breath FROM corona WHERE Corona = 'negative' AND Shortness_of_breath = 'True'
    UNION ALL
    SELECT 'Headache' AS symptom, Headache FROM corona WHERE Corona = 'negative' AND Headache = 'True'
) AS symptoms_data
GROUP BY symptom
ORDER BY symptom_count ASC
LIMIT 1;

-- Q.8.What are the most common symptoms among COVID positive males whose known contact was abroad? 
 SELECT
    symptom,
    COUNT(*) AS symptom_count
FROM (
    SELECT 'Cough_symptoms' AS symptom, Cough_symptoms FROM corona WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad' AND Cough_symptoms = 'True'
    UNION ALL
    SELECT 'Fever' AS symptom, Fever FROM corona WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad' AND Fever = 'True'
    UNION ALL
    SELECT 'Sore_throat' AS symptom, Sore_throat FROM corona WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad' AND Sore_throat = 'True'
    UNION ALL
    SELECT 'Shortness_of_breath' AS symptom, Shortness_of_breath FROM corona WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad' AND Shortness_of_breath = 'True'
    UNION ALL
    SELECT 'Headache' AS symptom, Headache FROM corona WHERE Corona = 'positive' AND Sex = 'male' AND Known_contact = 'Abroad' AND Headache = 'True'
) AS symptoms_data
GROUP BY symptom
ORDER BY symptom_count DESC;

 
 
 
 
 
 
 