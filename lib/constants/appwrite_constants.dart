class AppwriteConstants {
  static const String databaseId = "6474c36f7efbd43534c5";
  static const String collectionId = "6474c3858e593ec46bc8";
  static const String tweetCollectiton = "6482b123aed3bab1bdd8";
  static const String projectId = "6474c2da71a714118b81";
  static const String endpoint = "https://cloud.appwrite.io/v1";
  static const String imageBucketID = "648317e68f2e617606bd";
  static String imageUrl(String imageid){
    return "$endpoint/storage/buckets/$imageBucketID/files/$imageid/view?project=$projectId&mode=admin";
  }
}
