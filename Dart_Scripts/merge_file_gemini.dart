import 'dart:io';

Future<void> main() async {

  print("Welcome to the File Merger!");

  stdout.writeln('Enter name of first file:');
  final name1 = stdin.readLineSync();

  stdout.writeln('Enter name of second file:');
  final name2 = stdin.readLineSync();

  stdout.writeln('Enter name of output file:');
  final outputName = stdin.readLineSync();

  // 1. Check for nulls (Safety first!)
  if (name1 == null || name2 == null || outputName == null) {
    print('Invalid input. Please provide valid file names.');
    return;
  }

  // 2. Create actual File objects using the names
  final file1 = File(name1);
  final file2 = File(name2);
  final outputFile = File(outputName);

  // Read files (Now this works because file1 is a File object)
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
  
  // .path is a property of a File object, so this works now too
  print('Merged file written to: ${outputFile.path}');
}
