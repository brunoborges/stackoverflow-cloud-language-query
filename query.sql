DELETE FROM QuestionsByCloudVendor.AllQuestionsClassified WHERE 1 = 1;

INSERT INTO QuestionsByCloudVendor.AllQuestionsClassified 
SELECT
  EXTRACT(YEAR FROM TBD.creation_date) as Year,
  COUNT(*) AS NQuestions,
  ROUND(100 * SUM(IF(answer_count > 0, 1, 0)) / COUNT(*), 1) AS PAnswered,
  TBD.CloudVendor,
  TBD.ProgrammingLanguage
FROM
  ( -- BEGIN INNER SELECT
   SELECT 
    id, 
    creation_date, 
    answer_count, 
    CASE 
      WHEN (tags like '%azure%' or 
            lower(title) like '%azure%' or 
            lower(body) like '%azure%') 
           THEN 'Microsoft Azure'
      WHEN (tags like '%google_cloud%' or tags like '%gcp%' or 
            lower(title) like '%google cloud%' or lower(title) like '%gcp%' or 
            lower(body) like '%google cloud%' or lower(body) like '%gcp%') 
           THEN 'Google Cloud'
      WHEN (tags like '%aws%' or tags like '%amazon_web_services%' or 
            lower(title) like '%aws%' or lower(title) like '%amazon_web_services%' or 
            lower(body) like '%aws%' or lower(body) like '%amazon_web_services%') 
           THEN 'Amazon AWS'
      ELSE 'Not Cloud / Other'
    END as CloudVendor,
    CASE
      WHEN
        (-- Java Language
         -- Tags
         tags like 'java' or tags like '%|java' or tags like 'java|%' or tags like '%|java|%' or tags like '%scala%' or tags like '%kotlin%' or
         tags like 'javafx %' or tags like '% javafx' or tags like '% javafx %' or tags like '% scalafx %' or
         tags like 'awt %' or tags like '% awt' or tags like '% awt %' or tags like '% java swing %' or
         tags like '%java_ee%' or tags like '%j2ee%' or tags like '%jee%' or tags like '%tomcat%' or tags like '%jetty%' or 
         tags like '%spring%' or tags like '%struts%' or tags like '%dropwizard%' or tags like '%micronaut%' or tags like '%quarkus%' or
         tags like '%jboss%' or tags like '%glassfish%' or tags like '%weblogic%' or tags like '%websphere%' or tags like '%wildfly%' or tags like '%payara%' or
         tags like '%hadoop%' or tags like '%cassandra%' or tags like '%apache_spark%' or tags like '%kafka%' or tags like '%apache_storm%' or 
         tags like '%neo4j%' or tags like '%hazelcast%' or 
         tags like '%maven%' or tags like '%gradle%' or tags like '%apache_ant%' or 
         tags like '%intellij%' or tags like '%eclipse%' or tags like '%netbeans%'
         or 
         -- Title
         lower(title) like 'java %' or lower(title) like '% java' or lower(title) like '% java %' or lower(title) like '% scala %' or lower(title) like '%kotlin%' or
         lower(title) like 'javafx %' or lower(title) like '% javafx' or lower(title) like '% javafx %' or lower(title) like '% scalafx %' or
         lower(title) like 'awt %' or lower(title) like '% awt' or lower(title) like '% awt %' or lower(title) like '% java swing %' or
         lower(title) like '%java_ee%' or lower(title) like '%j2ee%' or lower(title) like '%jee%' or lower(title) like '%tomcat%' or lower(title) like '%jetty%' or 
         lower(title) like '%spring%' or lower(title) like '%struts%' or lower(title) like '%dropwizard%' or lower(title) like '%micronaut%' or lower(title) like '%quarkus%' or
         lower(title) like '%jboss%' or lower(title) like '%glassfish%' or lower(title) like '%weblogic%' or lower(title) like '%websphere%' or lower(title) like '%wildfly%' or lower(title) like '%payara%' or
         lower(title) like '%hadoop%' or lower(title) like '%cassandra%' or lower(title) like '%apache_spark%' or lower(title) like '%kafka%' or lower(title) like '%apache_storm%' or 
         lower(title) like '%neo4j%' or lower(title) like '%hazelcast%' or 
         lower(title) like '%maven%' or lower(title) like '%gradle%' or lower(title) like '%apache_ant%' or 
         lower(title) like '%intellij%' or lower(title) like '%eclipse%' or lower(title) like '%netbeans%'
         or
         -- Body
         lower(body) like 'java %' or lower(body) like '% java' or lower(body) like '% java %' or lower(body) like '% scala %' or lower(body) like '%kotlin%' or
         lower(body) like 'javafx %' or lower(body) like '% javafx' or lower(body) like '% javafx %' or lower(body) like '% scalafx %' or
         lower(body) like 'awt %' or lower(body) like '% awt' or lower(body) like '% awt %' or lower(body) like '% java swing %' or
         lower(body) like '%java_ee%' or lower(body) like '%j2ee%' or lower(body) like '%jee%' or lower(body) like '%tomcat%' or lower(body) like '%jetty%' or 
         lower(body) like '%spring%' or lower(body) like '%struts%' or lower(body) like '%dropwizard%' or lower(body) like '%micronaut%' or lower(body) like '%quarkus%' or
         lower(body) like '%jboss%' or lower(body) like '%glassfish%' or lower(body) like '%weblogic%' or lower(body) like '%websphere%' or lower(body) like '%wildfly%' or lower(body) like '%payara%' or
         -- lower(body) like '%hadoop%' or lower(body) like '%cassandra%' or lower(body) like '%apache_spark%' or lower(body) like '%kafka%' or lower(body) like '%apache_storm%' or 
         -- lower(body) like '%neo4j%' or lower(body) like '%hazelcast%' or 
         lower(body) like '%maven%' or lower(body) like '%gradle%' or lower(body) like '%apache_ant%' or 
         lower(body) like '%intellij%' or lower(body) like '%eclipse%' or lower(body) like '%netbeans%'
        )
        THEN 'Java'
      WHEN
        ( -- Node.js
         -- Tags
         tags like 'node.js' or tags like 'node.js|%' or tags like '%|node.js' or tags like '%|node.js|%' or
         tags like 'nodejs' or tags like 'nodejs|%' or tags like '%|nodejs' or tags like '%|nodejs|%' or
         tags like 'node' or tags like 'node|%' or tags like '%|node' or tags like '%|node|%' or
         tags like 'express.js' or tags like 'express.js|%' or tags like '%|express.js' or tags like '%|express.js|%' or
         tags like 'express' or tags like 'expressjs|%' or tags like '%|expressjs' or tags like '%|expressjs|%' or
         tags like 'express' or tags like 'express|%' or tags like '%|express' or tags like '%|express|%' or
         tags like 'meteor.js' or tags like 'meteor.js|%' or tags like '%|meteor.js' or tags like '%|meteor.js|%' or
         tags like 'meteor' or tags like 'meteorjs|%' or tags like '%|meteorjs' or tags like '%|meteorjs|%' or
         tags like 'meteor' or tags like 'meteor|%' or tags like '%|meteor' or tags like '%|meteor|%' or
         tags like 'adonis.js' or tags like 'adonis.js|%' or tags like '%|adonis.js' or tags like '%|adonis.js|%' or
         tags like 'adonis' or tags like 'adonisjs|%' or tags like '%|adonisjs' or tags like '%|adonisjs|%' or
         tags like 'adonis' or tags like 'adonis|%' or tags like '%|adonis' or tags like '%|adonis|%' or
         lower(title) like '%node.js%' or lower(body) like '%node.js%' or
         lower(title) like '%nodejs%' or lower(body) like '%nodejs%' or
         lower(title) like '%express.js%' or lower(body) like '%express.js%' or
         lower(title) like '%meteor.js%' or lower(body) like '%meteor.js%' or
         lower(title) like '%adonis.js%' or lower(body) like '%adonis.js%'
        )
        THEN 'Node.js'
      WHEN
        ( -- JavaScript Language
         -- Tags
         tags like '%javascript%' or tags like '%typescript%' or tags like '%electron%' or
         tags like '%react.js%' or tags like '%vue.js%' or tags like '%angular%' or 
         tags like '%reactjs%' or tags like '%vuejs%' or
         lower(title) like '%react.js%' or lower(body) like '%react.js%' or
         lower(title) like '%reactjs%' or lower(body) like '%reactjs%' or
         lower(title) like '%vue.js%' or lower(body) like '%vue.js%' or
         lower(title) like '%vuejs%' or lower(body) like '%vuejs%' or
         lower(title) like '%angular%' or lower(body) like '%angular%' or
         lower(title) like '%electron%' or lower(body) like '%electron%'
        )
        THEN 'JavaScript'
      WHEN
        (
         tags like 'c#%' or tags like '%c#' or tags like '%|c#|%' or
         tags like 'c#.net%' or tags like '%c#.net' or tags like '%|c#.net|%' or 
         tags like 'csharp%' or tags like '%csharp' or tags like '%|csharp|%' or 
         tags like 'c-sharp%' or tags like '%c-sharp' or tags like '%|c-sharp|%' or 
         tags like '.net%' or tags like '%.net' or tags like '%|.net|%' or tags like '%asp.net%'
        )
        THEN 'C# / .NET'
      WHEN
        (tags like '%python%' or tags like '%django%' or
         lower(title) like '%python%' or lower(title) like '%django%' or
         lower(body) like '%python%' or lower(body) like '%django%')
        THEN 'Python'
      WHEN
        (tags like '%php%' or lower(title) like '%php%' or lower(body) like '%php%' or
         tags like '%wordpress%' or lower(title) like '%wordpress%' or lower(body) like '%wordpress%')
        THEN 'PHP'
      WHEN
        (tags like '%ruby%' or lower(title) like '%ruby%' or lower(body) like '%ruby%' or
         tags like '%rails%' or lower(title) like '%rails%' or lower(body) like '%rails%')
        THEN 'Ruby'
      WHEN
        (tags like 'rust|%' or tags like 'rust' or tags like '%|rust' or tags like '%|rust|%' or
         lower(title) like '% rust %')
        THEN 'Rust'
      WHEN
        (tags like 'go|%' or tags like 'go' or tags like '%|go' or tags like '%|go|%')
        THEN 'Go'
      ELSE 'Other'
    END as ProgrammingLanguage,
    lower(tags) as tags,
    lower(title) as title, 
    lower(body) as body 
   FROM 
    `bigquery-public-data.stackoverflow.posts_questions`
   ) AS TBD -- END INNER SELECT
GROUP BY
  Year,
  TBD.CloudVendor,
  TBD.ProgrammingLanguage
HAVING  
  Year > 2008
ORDER BY
  Year,
  CloudVendor,
  ProgrammingLanguage
