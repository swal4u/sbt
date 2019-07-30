lazy val buildSettings = Seq(
  name := "hello-spark",
  version := "0.0.1",
  scalaVersion := "2.11.8",

  // https://mvnrepository.com/artifact/org.apache.spark/spark-core
  libraryDependencies += "org.apache.spark" %% "spark-core" % "2.3.0",

  // https://mvnrepository.com/artifact/org.apache.spark/spark-sql
  libraryDependencies += "org.apache.spark" %% "spark-sql" % "2.3.0",

  // https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core
  libraryDependencies += "org.apache.logging.log4j" % "log4j-core" % "2.11.2"
)

lazy val app = (project in file("."))
  .settings(buildSettings: _*)
