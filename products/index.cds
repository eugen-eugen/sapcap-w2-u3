namespace sap.capire.products;

using { Currency, managed, sap.common.CodeList, cuid } from '@sap/cds/common';

entity Products: managed {
    key ID: Integer;
    title : localized String(111);
    descr: localized String(111);
    stock: Integer;
    price: Decimal(9,2);
    currency: Currency;
    category: Association to Categories;
}

entity Categories: CodeList, cuid {
    parent: Association to Categories;
    children: Composition  of many Categories on children.parent = $self; 
}
