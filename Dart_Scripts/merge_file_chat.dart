import 'dart:io';

Future<void> main() async {
  final file1 = File('file1.txt');
  final file2 = File('file2.txt');
  final outputFile = File('merged_output.txt');

  // Read files
  final lines1 = await file1.readAsLines();
  final lines2 = await file2.readAsLines();

  // Convert to sets for comparison
  final set1 = lines1.toSet();
  final set2 = lines2.toSet();

  // Counts
  final count1 = lines1.length;
  final count2 = lines2.length;

  final duplicates = set1.intersection(set2);
  final duplicateCount = duplicates.length;

  // Merge without duplicates
  final mergedSet = {...set1, ...set2};

  // Write output
  await outputFile.writeAsString(
    mergedSet.join('\n'),
  );

  // Report
  print('File 1 lines: $count1');
  print('File 2 lines: $count2');
  print('Duplicates found: $duplicateCount');
  print('Final merged lines: ${mergedSet.length}');
  print('Merged file written to: ${outputFile.path}');
}
