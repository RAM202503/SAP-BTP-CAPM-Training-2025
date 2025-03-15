namespace reuse;

// Just like a Datatype : Reusability
type Guid : String(32);

// Just like a structure : Reusability
aspect address {
    house_no : String(20);
    street : String(32);
    city : String(80);
}