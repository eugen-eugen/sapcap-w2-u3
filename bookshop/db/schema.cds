namespace sap.capire.bookshop;
using {Currency, managed, cuid} from '@sap/cds/common';
using { sap.capire.products.Products } from '../../products/index';


entity  Books:Products {
    author: Association to Authors;
}

entity  Magazines:Products {
    author: String;
}

@cds.autoexpose
entity Authors : managed, cuid {
    key ID: Integer;
    name: String(111);
    dateOfBirth: Date;
    dateOfDeath: Date;
    placeOfBirth: String;
    placeOfDeath: String;
    books: Association to many Books on books.author = $self;
}

entity  Orders : managed, cuid {
    OrderNo: String @title:'Order Number';
    Items : Composition of many OrderItems on Items.parent = $self;    
    total: Decimal(9,2) @readonly;
    currency: Currency;
}

entity OrderItems: cuid {
  parent   : Association to Orders;
  book     : Association to Books;
  amount   : Integer;
  netAmount: Decimal(9,2);
  currency: Currency;
}

entity Movies: additionalInfo, cuid {
    name     : String(111); 
}

aspect additionalInfo{
    genre: String(100);
    language: String(200);
    aux: String(5);
}

