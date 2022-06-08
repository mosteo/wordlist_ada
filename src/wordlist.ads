with AAA.Strings;

package Wordlist with Elaborate_Body is

   type Word_Set is new AAA.Strings.Set with null record;

   subtype Word_Vector is AAA.Strings.Vector;

   --  Useful things

   function All_Words return Word_Set;

   function With_Length (Length : Positive) return Word_Set;

   not overriding
   function To_Vector (This : Word_Set) return Word_Vector;

end Wordlist;
