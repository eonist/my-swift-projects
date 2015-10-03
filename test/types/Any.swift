Because this array is known to contain only Movie instances, you can downcast and unwrap directly to a nonoptional Movie with the forced version of the type cast operator (as!):

for object in someObjects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
// Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
// Movie: 'Moon', dir. Duncan Jones
// Movie: 'Alien', dir. Ridley Scott
For an even shorter form of this loop, downcast the someObjects array to a type of [Movie] instead of downcasting each item:

for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
// Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
// Movie: 'Moon', dir. Duncan Jones
// Movie: 'Alien', dir. Ridley Scott
Any

Here’s an example of using Any to work with a mix of different types, including function types and non-class types. The example creates an array called things, which can store values of type Any: