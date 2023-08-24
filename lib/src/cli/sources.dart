class CLISource {
  final Uri downloadUrl;
  final String hash;

  CLISource(String downloadUrl, this.hash)
      : downloadUrl = Uri.parse(downloadUrl);

  CLISource from(String base) {
    final pathSegmentsLen = downloadUrl.pathSegments.length;
    final version = downloadUrl.pathSegments[pathSegmentsLen - 2];
    final name = downloadUrl.pathSegments[pathSegmentsLen - 1];

    final newPath = [
      ...downloadUrl.pathSegments.sublist(0, pathSegmentsLen - 2),
      version,
      name,
    ].join("/");
    final newDownloadUrl = downloadUrl.resolve(newPath).toString();
    return CLISource(newDownloadUrl, hash);
  }
}

// TODO after increasing min dart SDK version to 2.13.0
// typedef CLISources = Map<HostPlatform, CLISource>;
