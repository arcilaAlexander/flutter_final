import 'package:flutter/material.dart';
import 'package:flutter_app1/data/apiService.dart';
import 'package:flutter_app1/presenter/build_item_list.dart';
import 'package:flutter_app1/view/widgets/dialog_button.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              //construye con widget a traves de apis o listbuilder
              child: FutureBuilder(
                future: ApiService().GetDio(optionUrl: intNews),
                //se requiere un contexto para que los mensajes no se pierdan
                // se hace de comunicacion entre widget y widget
                // snapshot es lo que retorna el DIO el consumo del servicio
                builder: (context, snapshot) {
                  print('biuld_view-----------------------------------------');
                  print(snapshot);
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: (snapshot.data).articlesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BiuldItemList(
                            snapshotData: (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        content: Text(
                                            'Are you sure to add this news to favorite list'),
                                        actions: [
                                          DialogButton(
                                            text: 'NO',
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                          DialogButton(
                                            text: 'SI',
                                            onPressed: () {},
                                          )
                                        ],
                                      ));
                            });
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Container();
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();
    }
  }
}
