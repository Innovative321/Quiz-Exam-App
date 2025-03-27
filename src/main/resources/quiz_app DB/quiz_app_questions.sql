-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quiz_app
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_answers` varchar(255) NOT NULL,
  `is_multiple_choice` tinyint(1) DEFAULT '0',
  `selected_answers` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'What is the full form of JVM?','Java Virtual Machine','Java Visual Machine','Just Virtual Machine','Java Verified Machine','Java Virtual Machine',0,NULL),(2,'Which of the following is not a programming language?','Python','Java','HTML','C++','HTML',0,NULL),(3,'Which of the following are front-end technologies?','React','Node.js','Angular','MongoDB','React,Angular',1,NULL),(4,'Which of the following are programming languages?','Python','Java','HTML','SQL','Python,Java',1,NULL),(5,'Which of the following are features of Object-Oriented Programming (OOP)?','Encapsulation','Inheritance','Polymorphism','Compilation','Encapsulation,Inheritance,Polymorphism',1,NULL),(6,'Which of the following are cloud computing platforms?','AWS','Microsoft Azure','Google Cloud','MySQL','AWS,Microsoft Azure,Google Cloud',1,NULL),(7,'Which of the following are operating systems?','Windows','Linux','macOS','Apache','Windows,Linux,macOS',1,NULL),(8,'Which of the following is NOT a valid data structure?','Stack','Queue','Tree','Loop','Loop',0,NULL),(9,'What does the \"++\" operator do in C/C++?','Decrements a variable by 1','Multiplies a variable by 2','Increments a variable by 1','Divides a variable by 2','Increments a variable by 1',0,NULL),(10,'Which protocol is used for secure communication over the internet?','HTTP','FTP','HTTPS','SMTP','HTTPS',0,NULL),(11,'What is the default port number for HTTP?','21','25','80','443','80',0,NULL),(12,'Which device operates at the Data Link Layer of the OSI model?','Router','Switch','Hub','Repeater','Switch',0,NULL),(13,'What is the main function of an operating system?','To manage hardware resources','To provide a user interface','To execute application programs','All of the above','All of the above',0,NULL),(14,'Which scheduling algorithm allocates CPU to the process with the shortest burst time first?','FCFS (First Come First Serve)','SJF (Shortest Job First)','Round Robin','Priority Scheduling','SJF (Shortest Job First)',0,NULL),(15,'What is the purpose of virtual memory?','To increase the speed of the CPU','To provide additional storage for the operating system','To allow running larger applications than physical memory','To improve the performance of the GPU','To allow running larger applications than physical memory',0,NULL),(16,'Which language is used for styling web pages?','HTML','CSS','JavaScript','PHP','CSS',0,NULL),(17,'What is the smallest unit of data in a computer?','Byte','Bit','Nibble','Word','Bit',0,NULL),(18,'What is the waterfall model in software development?','An iterative development model','A linear sequential development model','A model that focuses on rapid prototyping','A model that emphasizes continuous integration','A linear sequential development model',0,NULL),(19,'What is a firewall used for?','To block unauthorized access to a network','To speed up internet connectivity','To store backup data','To encrypt data','To block unauthorized access to a network',0,NULL),(20,'What is phishing?','A type of malware','A method of stealing sensitive information by pretending to be a trustworthy entity','A technique to improve network performance','A type of encryption','A method of stealing sensitive information by pretending to be a trustworthy entity',0,NULL),(21,'What is the purpose of a compiler?','To execute programs','To translate high-level code into machine code','To debug programs','To manage memory','To translate high-level code into machine code',0,NULL),(22,'What is cloud computing?','A type of hardware used in data centers','A model for delivering computing resources over the internet','A programming language for web development','A type of operating system','A model for delivering computing resources over the internet',0,NULL),(23,'Which of the following is NOT a characteristic of cloud computing?','On-demand self-service','Broad network access','Limited scalability','Resource pooling','Limited scalability',0,NULL),(24,'What does \"elasticity\" mean in cloud computing?','The ability to scale resources up or down based on demand','The ability to store data permanently','The ability to run applications offline','The ability to encrypt data','The ability to scale resources up or down based on demand',0,NULL),(25,'Which cloud deployment model is shared by multiple organizations?','Public Cloud','Private Cloud','Hybrid Cloud','Community Cloud','Community Cloud',0,NULL),(26,'What is a hybrid cloud?','A cloud that is only accessible to a single organization','A combination of public and private clouds','A cloud that is shared by multiple organizations','A cloud that is used for gaming','A combination of public and private clouds',0,NULL),(27,'Which cloud deployment model offers the highest level of security?','Public Cloud','Private Cloud','Hybrid Cloud','Community Cloud','Private Cloud',0,NULL),(28,'What is the purpose of encryption in cloud computing?','To increase storage capacity','To protect data from unauthorized access','To improve network speed','To reduce costs','To protect data from unauthorized access',0,NULL),(29,'Which of the following is a cloud security concern?','Data breaches','High latency','Limited scalability','Lack of internet access','Data breaches',0,NULL),(30,'What is cloud storage?','A type of hardware used in data centers','A service that allows storing and accessing data over the internet','A programming language for web development','A type of operating system','A service that allows storing and accessing data over the internet',0,NULL),(31,'Which of the following is an example of cloud storage?','Google Drive','Microsoft Word','Adobe Photoshop','VMware','Google Drive',0,NULL),(32,'What is the advantage of using cloud storage?','Limited accessibility','High cost','Scalability and flexibility','Requires physical hardware maintenance','Scalability and flexibility',0,NULL),(33,'Which of the following is a benefit of cloud computing?','High upfront costs','Limited scalability','Pay-as-you-go pricing','Requires in-house IT expertise','Pay-as-you-go pricing',0,NULL),(34,'What is the main advantage of using a public cloud?','High security','Low cost and scalability','Complete control over resources','Requires physical hardware maintenance','Low cost and scalability',0,NULL),(35,'Which of the following is a challenge of cloud computing?','High upfront costs','Limited scalability','Data security and privacy concerns','Requires physical hardware maintenance','Data security and privacy concerns',0,NULL),(36,'What is the purpose of load balancing in cloud computing?','To distribute workloads across multiple servers','To increase storage capacity','To encrypt data','To reduce internet speed','To distribute workloads across multiple servers',0,NULL),(37,'Which topology has a dedicated point-to-point connection between each device?','Bus','Star','Ring','Mesh','Mesh',0,NULL),(38,'What is the main function of a firewall in networking?','Speed up internet connection','Block unauthorized access','Assign IP addresses','Encrypt all network traffic','Block unauthorized access',0,NULL),(39,'What is the main function of an operating system?','Process management','Memory management','File system management','All of the above','All of the above',0,NULL),(40,'In which type of OS do multiple users share system resources simultaneously?','Single-user OS','Multi-user OS','Batch OS','Real-time OS','Multi-user OS',0,NULL),(41,'Which of the following is NOT an open-source operating system?','Linux','Windows','Ubuntu','FreeBSD','Windows',0,NULL),(42,'What is the main advantage of a multiprocessor system?','Increased reliability','Faster processing speed','Better resource utilization','All of the above','All of the above',0,NULL),(43,'What is 25% of 200?','25','50','75','100','50',0,NULL),(44,'If the ratio of boys to girls in a class is 3:2 and there are 30 boys, how many girls are there?','10','20','30','40','20',0,NULL),(45,'A train travels 300 km in 5 hours. What is its speed?','50 km/h','60 km/h','70 km/h','80 km/h','60 km/h',0,NULL),(46,'What is the next number in the sequence: 2, 4, 8, 16, ___?','24','32','64','128','32',0,NULL),(47,'If 5 workers can complete a task in 10 days, how many days will 10 workers take to complete the same task?','2','5','10','20','5',0,NULL),(48,'If all roses are flowers and some flowers fade quickly, which of the following is true?','All roses fade quickly','Some roses fade quickly','No roses fade quickly','All flowers are roses','Some roses fade quickly',0,NULL),(49,'Find the odd one out:','Square','Circle','Triangle','Rectangle','Circle',0,NULL),(50,'If A = 1, B = 2, C = 3, ..., Z = 26, what is the value of \"CAT\"?','24','25','26','27','24',0,NULL),(51,'Which number replaces the question mark in the sequence: 1, 4, 9, 16, ___?','20','25','30','36','25',0,NULL),(52,'If today is Monday, what day will it be after 50 days?','Monday','Tuesday','Wednesday','Thursday','Wednesday',0,NULL),(53,'Choose the correct synonym for \"Benevolent\":','Cruel','Kind','Greedy','Angry','Kind',0,NULL),(54,'Identify the correct sentence:','She don?t like apples.','She doesn?t likes apples.','She doesn?t like apples.','She don?t likes apples.','She doesn?t like apples.',0,NULL),(55,'What is the antonym of \"Expand\"?','Increase','Contract','Extend','Grow','Contract',0,NULL),(56,'Choose the correct word to fill in the blank: \"She ___ to the store yesterday.\"','go','goes','went','gone','went',0,NULL),(57,'What is the meaning of the idiom \"Break the ice\"?','To start a conversation','To end a relationship','To cause trouble','To solve a problem','To start a conversation',0,NULL),(58,'If the average of 5 numbers is 20, what is their total sum?','50','100','150','200','100',0,NULL),(59,'A shopkeeper sold 40% of his stock on Monday and 30% of the remaining stock on Tuesday. What percentage of the original stock is left?','30%','40%','42%','58%','42%',0,NULL),(60,'If 3 cats catch 3 mice in 3 minutes, how many cats are needed to catch 100 mice in 100 minutes?','3','10','100','300','3',0,NULL),(61,'A man is 24 years older than his son. In 2 years, his age will be twice the age of his son. What is the son\'s current age?','20','22','24','26','22',0,NULL),(62,'Which of the following are valid access modifiers in Java?','public','private','protected','static','public,private,protected',1,NULL),(63,'Which of the following statements about Java arrays are true?','Arrays are fixed in size','Arrays can store primitive and reference data types','Arrays in Java are dynamic in size','Arrays are not objects in Java','Arrays are fixed in size,Arrays can store primitive and reference data types',1,NULL),(64,'Which of these are features of Java?','Object-Oriented','Platform-Independent','Multi-threaded','Supports multiple inheritance via classes','Object-Oriented,Platform-Independent,Multi-threaded',1,NULL),(65,'Which of the following are valid Java loop statements?','for','while','do-while','repeat-until','for,while,do-while',1,NULL),(66,'Which of the following collections allow duplicate elements?','ArrayList','HashSet','LinkedList','TreeSet','ArrayList,LinkedList',1,NULL),(67,'Which of the following statements about Java exception handling are correct?','The finally block always executes','Exceptions can be caught using the catch block','The throw keyword is used to catch exceptions','A method can declare exceptions using throws','The finally block always executes,Exceptions can be caught using the catch block,A method can declare exceptions using throws',1,NULL),(68,'Which of the following are wrapper classes in Java?','Integer','Double','int','Boolean','Integer,Double,Boolean',1,NULL),(69,'Which of the following statements about method overloading in Java are true?','Methods must have the same name but different parameters','Method overloading happens at compile-time','Method overloading requires using the final keyword','Methods with different return types can be overloaded without changing parameters','Methods must have the same name but different parameters,Method overloading happens at compile-time',1,NULL),(70,'Which of the following statements about Java constructors are true?','A constructor is called when an object is created','A constructor does not have a return type','A class can have only one constructor','A constructor can be overloaded','A constructor is called when an object is created,A constructor does not have a return type,A constructor can be overloaded',1,NULL),(71,'Which of the following are valid statements about Java multithreading?','Java supports multithreading using the Thread class','The Runnable interface can be used to create threads','The main method runs on a separate thread called daemon','sleep() method permanently stops a thread','Java supports multithreading using the Thread class,The Runnable interface can be used to create threads',1,NULL),(72,'Which of the following statements about the HashMap class are true?','It allows storing key-value pairs','It allows one null key','It allows duplicate keys','It allows multiple null values','It allows storing key-value pairs,It allows one null key,It allows multiple null values',1,NULL),(73,'Which of the following are features of Java Streams API?','Streams can process collections in parallel','Streams provide functional programming features','Streams can modify the original collection','Streams support filtering and mapping operations','Streams can process collections in parallel,Streams provide functional programming features,Streams support filtering and mapping operations',1,NULL),(74,'Which of the following are characteristics of Java memory management?','Java has automatic garbage collection','Objects are stored in the heap memory','Primitive variables are stored in the heap','Garbage collection is non-deterministic','Java has automatic garbage collection,Objects are stored in the heap memory,Garbage collection is non-deterministic',1,NULL),(75,'Which of the following statements about Java Strings are true?','Strings in Java are immutable','The StringBuilder class is mutable','String objects are stored in stack memory','The + operator can be used for String concatenation','Strings in Java are immutable,The StringBuilder class is mutable,The + operator can be used for String concatenation',1,NULL),(76,'Which of the following are valid Java design patterns?','Singleton','Factory','Prototype','Observer','Singleton,Factory,Observer',1,NULL),(77,'Which of the following are Java functional interfaces?','Runnable','Comparator','Predicate','List','Runnable,Comparator,Predicate',1,NULL),(78,'Which of the following are features of Java?s enum type?','Enums can have constructors','Enums can implement interfaces','Enums can extend other classes','Enums can have methods','Enums can have constructors,Enums can implement interfaces,Enums can have methods',1,NULL),(79,'Which of the following are valid ways to create a thread in Java?','Extending the Thread class','Implementing the Runnable interface','Using the ExecutorService framework','Using Thread.run() method','Extending the Thread class,Implementing the Runnable interface,Using the ExecutorService framework',1,NULL),(80,'Which of the following statements about JavaScript variables are true?','var','let','const','define','var,let,const',1,NULL),(81,'Which of the following are valid HTML5 elements?','<section>','<article>','<frame>','<aside>','<section>,<article>,<aside>',1,NULL),(82,'Which of the following attributes are used in the <img> tag?','src','alt','width','background','src,alt,width',1,NULL),(83,'Which of the following are valid CSS selectors?','#id','.class','element','-selector-','#id,.class,element',1,NULL),(84,'Which of the following are valid CSS display values?','block','inline','flex','top-bottom','block,inline,flex',1,NULL),(85,'Which of the following are valid JavaScript data types?','string','number','boolean','integer','string,number,boolean',1,NULL),(86,'Which of the following methods can be used to manipulate the DOM?','document.getElementById()','document.querySelector()','document.createElement()','document.modifyNode()','document.getElementById(),document.querySelector(),document.createElement()',1,NULL),(87,'Which of the following are valid JavaScript loop structures?','for','while','do-while','repeat-until','for,while,do-while',1,NULL),(88,'Which of the following are valid JavaScript array methods?','push()','pop()','filter()','remove()','push(),pop(),filter()',1,NULL),(89,'Which of the following are valid JavaScript frameworks?','React','Vue','Angular','Bootstrap','React,Vue,Angular',1,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 16:08:03
