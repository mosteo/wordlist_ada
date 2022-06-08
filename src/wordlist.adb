with Ada.Text_IO; use Ada.Text_IO;

with Resources;

with TOML.File_IO;

with Wordlist_Config;

package body Wordlist is

   ---------
   -- Log --
   ---------

   procedure Log (Text : String) is
   begin
      if Wordlist_Config.Logging then
         Put_Line (Text);
      end if;
   end Log;

   package My_Resources is new Resources
     (Crate_Name => Wordlist_Config.Crate_Name);

   Words : AAA.Strings.Set;

   function All_Words return AAA.Strings.Set is (Words);

   Table : constant TOML.TOML_Value :=
             TOML.File_IO.Load_File
               (My_Resources.Resource_Path & "wordlist.json").Value;

   List : constant TOML.TOML_Value := Table.Get ("wordlist");

begin
   for I in 1 .. List.Length loop
      Words.Insert (List.Item (I).As_String);
   end loop;

   Log ("Loaded " & AAA.Strings.Trim (Words.Length'Image) & " words");
end Wordlist;
