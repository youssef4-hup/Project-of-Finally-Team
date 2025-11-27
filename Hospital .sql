use hospital

--------------- عدد المرضى بناء على نوع الخدمه المقدمة--------------------------  
SELECT نوع_الخدمة, COUNT(*) AS عدد_الزيارات
FROM hospital_after_classification
GROUP BY نوع_الخدمة
ORDER BY عدد_الزيارات DESC;

----------------متوسط الرضا العام بناء على  نوع الخدمة المقدمة -------------------
SELECT نوع_الخدمة, AVG(الرضا_العام) AS متوسط_الرضا
FROM hospital_after_classification
GROUP BY نوع_الخدمة
ORDER BY متوسط_الرضا DESC;

----------------الرضا العام بناء على الفئة العمرية---------------------
SELECT العمر, AVG(الرضا_العام) AS متوسط_الرضا
FROM hospital_after_classification
GROUP BY العمر;

---------------- أداء طاقم التمريض 
SELECT 
  AVG(اهتمام_التمريض) AS الاهتمام,
  AVG(احترام_التمريض) AS الاحترام,
  AVG(استجابة_التمريض) AS سرعةاستجابة
FROM hospital_after_classification

----------------- مؤشر نظافة المستشفى 
SELECT 
  AVG(نظافة_الانتظار) AS قاعات_الإنتظار,
  AVG(نظافة_الغرف) AS الغرف,
  AVG(نظافة_الممرات) AS الممرات,
  AVG(نظافة_الحمامات) AS الحمامات
FROM hospital_after_classification;

--------------- أفضل خدمه مقدمه من حيث مؤشر النظافة--------------
SELECT TOP 1 
    نوع_الخدمة AS الخدمه_المقدمة,
    نظافة_الغرف, 
    نظافة_الحمامات AS نظافة_المراحيض ,
    نظافة_الانتظار AS نظافة_قاعات_الإنتظار,
    نظافة_الممرات
FROM hospital_after_classification
ORDER BY 
    نظافة_الغرف DESC,
    نظافة_الحمامات DESC,
    نظافة_الانتظار DESC, 
    نظافة_الممرات DESC;


--------------- أفضل شيء في تجربة المريض-----------------
SELECT أفضل_شيء, COUNT(*) AS عدد
FROM hospital_after_classification
WHERE أفضل_شيء IS NOT NULL AND أفضل_شيء <> ''
GROUP BY أفضل_شيء
ORDER BY عدد DESC;

---------------- تحليل الجنس
SELECT النوع, COUNT(*) AS العدد
FROM hospital_after_classification
GROUP BY النوع;

---------------- تقييم الرعايةالصحية  المقدمة من طاقم التمريض.
SELECT الفئة, AVG(اهتمام_التمريض) AS اهتمام_طاقم_التمريض
FROM hospital_after_classification
GROUP BY الفئة;

------------------مؤشر سهولة عملية الحجز بالنسبة للخدمات المقدمة 
SELECT نوع_الخدمة, AVG(سهولة_الحجز) AS مؤشر_سهولة_الحجز
FROM hospital_after_classification
GROUP BY نوع_الخدمة 
ORDER BY مؤشر_سهولة_الحجز ASC;

------------------- مؤشر تقييم وضوح الشرح بناء على الجنس  
SELECT النوع, AVG(وضوح_الشرح) AS مؤشر_وضوح_الشرح
FROM hospital_after_classification
GROUP BY النوع;

-------------------- تقييم سهولة الدفع
  SELECT AVG(TRY_CAST(راحة_الدفع AS INT)) AS متوسط_سهولة_الدفع
  FROM hospital_after_classification
  WHERE TRY_CAST(راحة_الدفع AS INT) IS NOT NULL;

  -------------------- تقييم سهولة الدفع بناء على متلقى الخدمه
  SELECT الفئة, AVG(TRY_CAST(راحة_الدفع AS INT)) AS مؤشر_سهولة_الدفع
  FROM hospital_after_classification
  WHERE TRY_CAST(راحة_الدفع AS INT) IS NOT NULL
  GROUP BY الفئة;

  ------------------مؤشر جودة الوجبات المقدمة
  SELECT AVG(جودة_الوجبات) AS مؤشر_جودة_الوجبات
  FROM hospital_after_classification
  WHERE جودة_الوجبات IS NOT NULL
  

  -------------------مؤشر جودة الوجبات بناء على نوع الخدمة المقدمة 
  SELECT نوع_الخدمة,AVG(جودة_الوجبات) AS مؤشر_جودة_الوجبات
  FROM hospital_after_classification
  WHERE جودة_الوجبات IS NOT NULL
  GROUP BY نوع_الخدمة

  ---------------------مؤشر جودة الوجبات بناء على متلقى الخدمة 
  SELECT الفئة,AVG(جودة_الوجبات) AS مؤشر_جودة_الوجبات
  FROM hospital_after_classification
  WHERE جودة_الوجبات IS NOT NULL
  GROUP BY الفئة

  ----------------------مؤشر توصية المستشفيات للغير
  SELECT AVG(التوصية) AS مؤشر_التوصية
  from hospital_after_classification

  ------------------------مؤشر توصية المستشفيات للغير  بناء على متلقىالخدمه 
  SELECT الفئة,AVG(التوصية) AS مؤشر_التوصية
  from hospital_after_classification
  GROUP BY الفئة
  
  ---------------------------تقييم سهولة الخروج
  SELECT AVG(سهولة_الخروج) AS مؤشر_سهولة_الخروج
  FROM hospital_after_classification

  ---------------------------تقييم سهولة الخروج بناء على نوع الخدمه المقدمه
  SELECT نوع_الخدمة,AVG(سهولة_الخروج) AS مؤشر_سهولة_الخروج
  FROM hospital_after_classification
  GROUP BY نوع_الخدمة

  --------------------------تقييم سهولة الخروج بناء على متلقى الخدمه
  SELECT الفئة,AVG(سهولة_الخروج) AS مؤشر_سهولة_الخروج
  FROM hospital_after_classification
  GROUP BY الفئة

  --------------------------تقييم وضوح الفواتير
  SELECT AVG(وضوح_الفواتير) AS مؤشر_وضوح_الفواتير
  FROM hospital_after_classification

  --------------------------تقييم وضوح الفواتير بالنسبة لمتلقى الخدمه
  SELECT الفئة  , AVG(وضوح_الفواتير) AS مؤشر_وضوح_الفواتير
  FROM hospital_after_classification
  GROUP BY الفئة

  ---------------------------تقييم تنسيق الأقسام وفقا لنوع الخدمه المقدمه
  SELECT نوع_الخدمة,AVG(تنسيق_الأقسام) AS مؤشر_تنسيق_الأقسام
  FROM hospital_after_classification
  GROUP BY نوع_الخدمة

  ----------------------------تقييم مؤشر الهدوء وفقا لنوع الخدمه النقدمه
  SELECT نوع_الخدمة,AVG(الهدوء) AS مؤشر_الهدوء
  FROM hospital_after_classification
  GROUP BY نوع_الخدمة

  ------------------------------تقييم مؤشر الهدوء
  SELECT AVG(الهدوء) AS مؤشر_الهدوء
  FROM hospital_after_classification

  -----------------------------

  













