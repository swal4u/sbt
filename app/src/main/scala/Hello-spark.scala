import org.apache.log4j.{Level, Logger}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.types.{StringType, StructType}

object ConnexionLocal extends App {
  Logger.getLogger("org").setLevel(Level.WARN)

  val warehouseLocation = "/user/hive/warehouse"

  val spark = SparkSession.builder
    .master("local")
    .appName("Hello Spark")
    .config("spark.sql.warehouse.dir", warehouseLocation)
    .getOrCreate()

  Runner.run(spark)

}

object Runner {
  def run(spark: SparkSession): Unit = {

    val myfile = spark.read.format("csv")
      .option("header", "false")
      .option("delimiter","\\t")
      .option("charset","UTF-8")
      .load("/app/src/main/resources/test.csv")
    myfile.take(1).foreach(println)
  }
}
