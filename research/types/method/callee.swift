//use self
// or us this when debugging onlyhttp://stackoverflow.com/questions/1451342/objective-c-find-caller-of-method

/*
NSString *sourceString = [[NSThread callStackSymbols] objectAtIndex:1];
// Example: 1   UIKit                               0x00540c89 -[UIApplication _callInitializationDelegatesForURL:payload:suspended:] + 1163
NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@" -[]+?.,"];
NSMutableArray *array = [NSMutableArray arrayWithArray:[sourceString  componentsSeparatedByCharactersInSet:separatorSet]];
[array removeObject:@""];

NSLog(@"Stack = %@", [array objectAtIndex:0]);
NSLog(@"Framework = %@", [array objectAtIndex:1]);
NSLog(@"Memory address = %@", [array objectAtIndex:2]);
NSLog(@"Class caller = %@", [array objectAtIndex:3]);
NSLog(@"Function caller = %@", [array objectAtIndex:4]);

*/