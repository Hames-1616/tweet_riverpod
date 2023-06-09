//no abstract class because there is just one function


import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/constants/appwrite_constants.dart';
import 'package:riverpod_learning/core/providers.dart';


final storageApiProvider = Provider((ref) {
  return StorageApi(storage: ref.watch(storageProvider));
});

class StorageApi{
  final Storage _storage;
  StorageApi({
    required Storage storage
  }) : _storage=storage;


  Future<List<String>> uploadImage(List<File> files) async{
    List<String> imageLinks=[];
    for(final file in files)
    {
       final uploadedImage = await _storage.createFile(bucketId:  AppwriteConstants.imageBucketID, fileId: ID.unique(), file: InputFile.fromPath(path: file.path));
      imageLinks.add(AppwriteConstants.imageUrl(uploadedImage.$id));
    }

    return imageLinks; 
  }
}