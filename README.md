# marklogic-via-odbc
Intended to demonstrate using MarkLogic's ODBC driver.

## Set Up

This is a ml-gradle project not presently configured as a MarkLogic Data Hub.

To deploy:

1. Review `gradle.properties`, and override in `gradle-local.properties` as desired.
1. Run `./gradlew mlDeploy`.  Deployment includes requirements to load the sample data, including databases, MLCP transform function, and TDE templates.
1. Run `./gradlew loadData`.  Seeks out specific files within `data/dbgen`, adds a header row, then loads into ML using MLCP such that the data aligns with the TDE templates.
1. TODO: Offer ways to verify data is accessible via SQL (e.g., QConsole and ODBC Query Tool)

TODO: Install ML's ODBC driver and configure a data source name (DNS).

## Sample Data

TODO: discuss `dbgenConfig` that's defined in `build.gradle` and question defning that info in `gradle.properties`.

TODO: discuss regenerating the data and overriding files within `data/dbgen`.

```
Ml-via-odbc-dbgen tasks
-----------------------
addHeaderRowToCustomer - Adds the header row to the dbgen 'customer' sample data.
addHeaderRowToLineitem - Adds the header row to the dbgen 'lineitem' sample data.
addHeaderRowToNation - Adds the header row to the dbgen 'nation' sample data.
addHeaderRowToOrders - Adds the header row to the dbgen 'orders' sample data.
addHeaderRowToPart - Adds the header row to the dbgen 'part' sample data.
addHeaderRowToPartsupp - Adds the header row to the dbgen 'partsupp' sample data.
addHeaderRowToRegion - Adds the header row to the dbgen 'region' sample data.
addHeaderRowToSupplier - Adds the header row to the dbgen 'supplier' sample data.
copyData - Copies this project's dbgen data to the build directory.
loadCustomer - Loads the dbgen 'customer' sample data into ML.
loadData - Load all of this project's dbgen sample data into ML.
loadLineitem - Loads the dbgen 'lineitem' sample data into ML.
loadNation - Loads the dbgen 'nation' sample data into ML.
loadOrders - Loads the dbgen 'orders' sample data into ML.
loadPart - Loads the dbgen 'part' sample data into ML.
loadPartsupp - Loads the dbgen 'partsupp' sample data into ML.
loadRegion - Loads the dbgen 'region' sample data into ML.
loadSupplier - Loads the dbgen 'supplier' sample data into ML.
```