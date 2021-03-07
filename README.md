# BadgeForButton

Προσθέτει ένα badge με αριθμό (δηλαδή έναν αριθμό πάνω δεξιά μέσα σε κύκλο) σε ένα View.

Το δημιουργούμε έτσι:

``` swift
Button {
    print("Pressed")
} label: {
    Text("Hello!")
}
.badgeNumber(3)
```
> Θα εμφανίζει τον αριθμό 3 μέσα σε κόκκινο κύκλο στο πάνω δεξί μέρος του Button.

### Τύπος συνάρτησης:
Η συνάρτηση έχει τύπο:

`func badgeNumber(_ badgeNum: Int, font: Font = Font.caption2, color: Color = .red) -> some View`

επομένως μπορούμε να θέλουμε να αλλάξουμε την γραμματοσειρά και το χρώμα του κύκλου.
