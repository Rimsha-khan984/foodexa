import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodexa/productdetail/index.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final ScrollController _categoryScrollController =
  ScrollController();

  final List<GlobalKey> _categoryKeys = [];
  int selectedIndex=0;

  int selectedCategories=0;

  final List categories =[
    "All",
    "Combos",
    "Slider",
    "Classic",
    "Chicken",
    'Vegetarian',
  ];

  bool isloading=true;

  List products=[];
  List filtered=[];
  final Set<int> favourite={};

  void fetchfoods()async{
    final response=await http.get(
      Uri.parse("https://dummyjson.com/products/category/groceries"),
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      setState(() {
        products=data['products'];
        filtered=products;
      });
    }
  }
  void search(String text)async{
    setState(() {
      filtered=products
          .where((r)=> r['title'].toString().toLowerCase().contains(text.toLowerCase()))
          .toList();
    });

  }

  @override
  void initState(){
    super.initState ();
    _categoryKeys.addAll(
      List.generate(categories.length, (_) => GlobalKey()),
    );
    fetchfoods();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                    children: [
                       Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: search,
                    onTap: (){},
                    decoration: InputDecoration(
                      hintText:"Search" ,
                      prefixIcon: Icon(Icons.search,color: Colors.black,),
                      contentPadding: EdgeInsetsGeometry.symmetric(vertical: 16),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                IconButton.filled(onPressed: (){},
                    style: IconButton.styleFrom(
                      backgroundColor:Color.fromARGB(218, 4, 151, 9),
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                    icon:Icon(Icons.tune,color: Colors.white,) )
              ],
            ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          controller: _categoryScrollController,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                          itemCount: categories.length,
                          itemBuilder:(context, index) {
                            final bool isSelected= selectedCategories ==index;
                           return Padding(
                              padding:EdgeInsetsGeometry.only(right: 12),
                              child: ChoiceChip(
                                key: _categoryKeys[index],
                                label: Text(categories[index],),
                                selected:isSelected,
                                selectedColor: Color.fromARGB(218, 4, 151, 9),
                                backgroundColor: const Color(0xFFF3F4F6),

                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: isSelected ?Colors.white
                                      :Colors.grey.shade700,
                                  fontWeight: isSelected ? FontWeight.w600:FontWeight.w500,
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                  side: BorderSide.none,
                                ),

                                showCheckmark: false,

                                padding: EdgeInsetsGeometry.symmetric(horizontal: 17,vertical: 10),

                                elevation: isSelected ? 4 : 0,
                                shadowColor: Colors.black.withValues(alpha: 0.15),
                                pressElevation: 0,

                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                                onSelected:  (selected) {
                                  setState(() {
                                    selectedCategories=index;
                                  });

                                  final chipContext= _categoryKeys[index].currentContext;
                                  if(chipContext!= null){
                                    Scrollable.ensureVisible(
                                      chipContext,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      alignment: 0.5,

                                    );
                                  }

                                } ,

                              ),
                            );

                        },),
                      ),

                      const SizedBox(height: 20,),

                      Expanded(
                        child: GridView.builder(

                            itemCount: filtered.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing:12,
                                mainAxisSpacing: 14,
                                childAspectRatio: 0.67,
                            ),
                            itemBuilder:(context,index ){
                            final product= filtered[index];

                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (_) => productdetail(productsDetail: product)),
                                );
                              },

                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius:12,
                                      offset:Offset(0, 4),
                                    )
                                  ]
                                ),

                                clipBehavior: Clip.antiAlias,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child:Image.network(
                                          product['thumbnail'],
                                          width: double.infinity,
                                          fit: BoxFit.contain,

                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey.shade700,
                                              child: Center(
                                                child: Icon(
                                                  Icons.image_not_supported
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                    ),

                                    Padding(padding: EdgeInsetsGeometry.fromLTRB(12, 11, 10, 12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            product['title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 9,),

                                          Row(
                                            children: [
                                              Expanded(
                                                  child:
                                                  Row(
                                                    children: [
                                                      Icon(Icons.star,color: Colors.amberAccent,),
                                                      SizedBox(width: 4,),
                                                      Text(
                                                        product["rating"].toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:30 ,),
                                              Icon(Icons.favorite_outline,color: Colors.black,)

                                            ],

                                          )


                                        ],

                                      ),
                                    )

                                  ],

                                ),





                              ),
                            );



                            }

                        ),
                      )


                    ],
            ),
          )
      ) ,
    );
  }
}
