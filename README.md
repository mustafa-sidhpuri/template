# template

template by techy panther

### Dependencies
- hive: any 
- hive_flutter: any
### Dev Dependencies
- build_runner: any 
- hive_generator: any

### Changes in main file

Add following in main file
- WidgetsFlutterBinding.ensureInitialized();
- await Hive.initFlutter();
- Register adapters, for eg: Hive.registerAdapter(ModelClassAdapter());
- Open a hive box, for eg: await Hive.openBox<ModelClass>("modelclass");

### Creating Model Class for Hive
- Each class should have unique typeId.
- After building the model class, run the following command in terminal
  - flutter packages pub run build_runner build OR flutter pub run build_runner build 

## References
- https://www.youtube.com/watch?v=w8cZKm9s228