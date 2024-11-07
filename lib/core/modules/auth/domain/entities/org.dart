import 'package:equatable/equatable.dart';

class Org extends Equatable
{

  const Org({required this.Id, required this.ParentId, required this.Name, required this.ShortName});

  final int Id;
  final int ParentId;
  final String? Name;
  final String? ShortName;

  int getNetworkId(){
    return ParentId == 0 ? Id : ParentId;
  }

  @override
  List<Object?> get props => [Id, ParentId,Name, ShortName];


}