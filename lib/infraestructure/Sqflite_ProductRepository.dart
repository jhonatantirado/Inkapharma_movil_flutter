import 'package:inkapharma/assembler/product_assembler.dart';
import 'package:inkapharma/infraestructure/ProductRepository.dart';
import 'package:inkapharma/data/database_helper.dart';
import 'package:inkapharma/model/product.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteProductRepository implements ProductRepository {
  final assembler = ProductAssembler();

  DatabaseHelper databaseMigration;

  SqfliteProductRepository(this.databaseMigration);

  @override
  Future<int> insert(Product product) async {
    final db = await databaseMigration.db;
    var id = await db.insert(assembler.tableName, assembler.toMap(product));
    return id;
  }

  @override
  Future<int> delete(Product product) async {
    final db = await databaseMigration.db;
    int result = await db.delete(assembler.tableName,
        where: assembler.columnId + " = ?", whereArgs: [product.id]);
    return result;
  }

  @override
  Future<int> update(Product product) async {
    final db = await databaseMigration.db;
    int result = await db.update(assembler.tableName, assembler.toMap(product),
        where: assembler.columnId + " = ?", whereArgs: [product.id]);
    return result;
  }
 
  @override
 Future<Product> getProduct(Product product) async{
    final db = await databaseMigration.db;
    List<Map> result = await db.rawQuery("SELECT * FROM Product where id=?",[product.id]);
    if (result.isNotEmpty){
      var element = result.elementAt(0);
      return new Product.withId(element["id"],element["name"],element["price"],element["quantity"],element["imageUrl"]);
    } else{
      return null;
    }
  }

  @override
  Future<List<Product>> getList() async {
    final db = await databaseMigration.db;
    print('Secondary Thread Future getList 1');
    var result = await db.rawQuery("SELECT * FROM Product order by name ASC");
    print('Secondary Thread Future getList 2');
    print(result);
    List<Product> product = assembler.fromList(result);
    print('Secondary Thread Future getList 3');
    return product;
  }

  Future<int> getCount() async {
    final db = await databaseMigration.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM Product')
    );
    return result;
  }
}