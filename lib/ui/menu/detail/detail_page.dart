/*
// dart async library you will refer to when setting up real time updates
import 'dart:async';

// flutter and ui libraries
import 'package:flutter/material.dart';

// amplify packages you will need to use
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// amplify configuration and models that should have been generated for you
import 'package:joodle_ver_one/amplifyconfiguration.dart';
import 'package:joodle_ver_one/models/CheckboxModel.dart';
import 'package:joodle_ver_one/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // list of Todos - initially empty
  List<CheckboxModel> _checkboxes = [];

  // subscription of Todo QuerySnapshots - to be initialized at runtime
  // 실시간 업데이트 반영
  late StreamSubscription<QuerySnapshot<CheckboxModel>> _subscription;

  @override
  void initState() {
    // kick off app initialization
    _initializeApp();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
    //구독 취소소
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    // Query and Observe updates to Todo models. DataStore.observeQuery() will
    // emit an initial QuerySnapshot with a list of Todo models in the local store,
    // and will emit subsequent snapshots as updates are made
    //
    // each time a snapshot is received, the following will happen:
    // _isLoading is set to false if it is not already false
    // _todos is set to the value in the latest snapshot
    // 실시간 업데이트 반영
    _subscription = Amplify.DataStore.observeQuery(CheckboxModel.classType)
        .listen((QuerySnapshot<CheckboxModel> snapshot) {
      setState(() {
        if (_isLoading) _isLoading = false;
        _checkboxes = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {

      // amplify plugins
      final dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
      final apiPlugin = AmplifyAPI();
      final authPlugin = AmplifyAuthCognito();

      // add Amplify plugins
      await Amplify.addPlugins([dataStorePlugin, apiPlugin, authPlugin]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {

      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : TodosList(todos: _checkboxes),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoForm()),
          );
        },
        tooltip: 'Add Todo',
        label: Row(
          children: const [Icon(Icons.add), Text('Add todo')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({
    required this.todos,
    Key? key,
  }) : super(key: key);

  final List<CheckboxModel> todos;

  @override
  Widget build(BuildContext context) {
    return todos.isNotEmpty
        ? ListView(
        padding: const EdgeInsets.all(8),
        children: todos.map((checkbox) => TodoItem(checkbox: checkbox)).toList())
        : const Center(
      child: Text('Tap button below to add a todo!'),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.checkbox,
    Key? key,
  }) : super(key: key);

  final double iconSize = 24.0;
  final CheckboxModel checkbox;

  // Todo 삭제
  void _deleteTodo(BuildContext context) async {
    try {
      // to delete data from DataStore, you pass the model instance to
      // Amplify.DataStore.delete()
      await Amplify.DataStore.delete(checkbox);
    } catch (e) {
      safePrint('An error occurred while deleting Todo: $e');
    }
  }

  // Todo 업데이트, copyWith로 업데이트, 할일을 완료했다는 의미
  Future<void> _toggleIsComplete() async {
    // copy the Todo you wish to update, but with updated properties
    final updatedTodo = checkbox.copyWith(isSelected: !checkbox.isSelected);
    try {

      // to update data in DataStore, you again pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      safePrint('An error occurred while saving Todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsComplete();
        },
        onLongPress: () {
          _deleteTodo(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    checkbox.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //Text(checkbox.price ?? 'No description'),
                ],
              ),
            ),
            Icon(
                checkbox.isSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: iconSize),
          ]),
        ),
      ),
    );
  }
}

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }

  //DB에 데이터 저장
  Future<void> _saveTodo() async {
    // get the current text field contents
    final name = _nameController.text;
    final price = _descriptionController.text;
    // create a new Todo from the form values
    // `isComplete` is also required, but should start false in a new Todo
    final newTodo = CheckboxModel(
      name: name,
      price: price.isNotEmpty ? price : null,
      isSelected: false,
    );
    try {
      // to write data to DataStore, you simply pass an instance of a model to
      // Amplify.DataStore.save()
      await Amplify.DataStore.save(newTodo);
      // after creating a new Todo, close the form
      // Be sure the context at that moment is still valid and mounted
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      safePrint('An error occurred while saving Todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration:
                const InputDecoration(filled: true, labelText: 'Name'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    filled: true, labelText: 'Description'),
              ),
              ElevatedButton(
                onPressed: _saveTodo,
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/


import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/bottom_appbar.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/caution_message.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/checkbox_button.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/count_button.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/detail_info.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/image_view.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/radiobox_button.dart';
import 'package:joodle_ver_one/ui/menu/detail/widgets/white_space.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _detailPage createState() => _detailPage();
}

class _detailPage extends State<DetailPage> {
  var f = NumberFormat('###,###,###,###'); //3자리마다 쉼표
  int _currentPage = 0; // imageslider index
  int total_price = 0;
  String menu_name = "살마니아구찜";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: BottomBar(),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), //glow 현상 없앰
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              final scrolled = constraints.scrollOffset > 190; //scroll 크기 감지
              return SliverAppBar(
                backgroundColor: scrolled ? Colors.white : Colors.transparent,
                pinned: true, // appbar 완전히 사라지게
                expandedHeight: 250.0, // appbar 크기
                title: Text(
                  menu_name,
                  style: TextStyle(color: scrolled ? Colors.black : Colors.transparent),
                ),
                stretch: true, //glow 현상 없앰
                actions: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined),
                    tooltip: 'Open home',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    tooltip: 'Open home',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    tooltip: 'Open shopping cart',
                    onPressed: () {
                      //handle the press
                    },
                  ),
                ],
                iconTheme: IconThemeData(
                  color: scrolled ? Colors.black : Colors.white,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: const [
                    StretchMode.zoomBackground,
                  ],
                  background: scrolled ?
                  Container() : const ImageView() //scroll정도에 따라 빈 container 또는 image
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              return Column(
                children: [
                  DetailInfo(),
                  WhiteSpace(),
                  RadioButton(),
                  //WhiteSpace(),
                  CheckboxButton(),
                  //WhiteSpace(),
                  CountButton(),
                  CautionMessage(),
                ],
              );
            },
            childCount: 1, // SliverList 내부 위젯 반복 횟수 설정
          ),
        ),
      ],),
    );
  }
}