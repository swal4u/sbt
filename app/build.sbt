lazy val root = (project in file(".")).settings(
  inThisBuild(List(scalaVersion := "2.13.18", version := "0.1.0")),
  name := "kiss",
  //javaOptions ++= Seq("-Xms512M", "-Xmx2048M", "-XX:+CMSClassUnloadingEnabled"),
  javaOptions ++= Seq("-Xms512M", "-Xmx2048M", "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED"),
  scalacOptions ++= Seq("-deprecation", "-unchecked"),
  Test / parallelExecution := false,
  Test / fork := true
)

libraryDependencies ++= Seq(
  "org.apache.spark"         %% "spark-sql"            % "4.1.1"    % "provided",
  "org.scalameta"            %% "munit"                % "1.0.0-M7" % Test,
  "com.github.mrpowers"      %% "spark-fast-tests"     % "1.3.0"    % Test,
  "com.typesafe"              % "config"               % "1.4.1",
  "org.postgresql"            % "postgresql"           % "42.6.0",
  "org.apache.kafka"          % "kafka-clients"        % "3.4.0",
  "org.apache.spark"         %% "spark-sql-kafka-0-10" % "4.1.1",
  "com.lihaoyi"              %% "os-lib"               % "0.9.1",
  "org.apache.logging.log4j"  % "log4j-core"           % "2.20.0",
  "org.apache.logging.log4j"  % "log4j-api"            % "2.20.0",
  "org.apache.logging.log4j" %% "log4j-api-scala"      % "12.0"
)
