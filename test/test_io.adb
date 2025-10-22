------------------------------------------------------------------------------
--  Test Program for SML.IO (staged crate)
--  Validates file I/O operations
------------------------------------------------------------------------------

with Ada.Text_IO;
with SML.DOM;
with SML.DOM.Parser;
with SML.IO;

procedure Test_IO is
   use Ada.Text_IO;
   use SML.IO;

   --  Test file paths (reuse top-level fixtures during staging)
   Valid_Small_Path  : constant String := "../../test/fixtures/valid_small.sml";
   Valid_Medium_Path : constant String := "../../test/fixtures/valid_medium.sml";
   Invalid_Path      : constant String := "../../test/fixtures/invalid.sml";
   Nonexistent_Path  : constant String := "../../test/fixtures/does_not_exist.sml";
   Output_Path       : constant String := "bin/output_test.sml";

   procedure Test_Read_Small_File is
      Result : constant Read_Result := Read_File (Valid_Small_Path);
   begin
      Put ("Test: Read Small File... ");
      if Result.Status /= Success or else Result.Content_Length = 0 then
         Put_Line ("FAILED: " & Status_Message (Result.Status));
      else
         Put_Line ("✓ PASSED (" & Result.Content_Length'Image & " bytes)");
      end if;
   end Test_Read_Small_File;

   procedure Test_Read_Medium_File is
      Result : constant Read_Result := Read_File (Valid_Medium_Path);
   begin
      Put ("Test: Read Medium File... ");
      if Result.Status = Success and then Result.Content_Length > 0 then
         Put_Line ("✓ PASSED (" & Result.Content_Length'Image & " bytes)");
      else
         Put_Line ("FAILED: " & Status_Message (Result.Status));
      end if;
   end Test_Read_Medium_File;

   procedure Test_Read_Nonexistent_File is
      Result : constant Read_Result := Read_File (Nonexistent_Path);
   begin
      Put ("Test: Read Nonexistent File... ");
      if Result.Status = File_Not_Found then
         Put_Line ("✓ PASSED (correctly detected)");
      else
         Put_Line ("FAILED: Expected File_Not_Found");
      end if;
   end Test_Read_Nonexistent_File;

   procedure Test_Parse_Valid_File is
      Result : constant SML.DOM.Parser.Parse_Result := Parse_File (Valid_Small_Path);
   begin
      Put ("Test: Parse Valid File... ");
      if Result.Success then
         Put_Line ("✓ PASSED (document loaded)");
      else
         Put_Line ("FAILED: Parse failed");
      end if;
   end Test_Parse_Valid_File;

   procedure Test_Parse_Invalid_File is
      Result : constant SML.DOM.Parser.Parse_Result := Parse_File (Invalid_Path);
   begin
      Put ("Test: Parse Invalid File... ");
      if not Result.Success then
         Put_Line ("✓ PASSED (correctly detected parse error)");
      else
         Put_Line ("FAILED: Should have failed to parse");
      end if;
   end Test_Parse_Invalid_File;

   procedure Test_Parse_Nonexistent_File is
      IO_Err : constant IO_Status := Parse_File_IO_Error (Nonexistent_Path);
   begin
      Put ("Test: Parse Nonexistent File... ");
      if IO_Err = File_Not_Found then
         Put_Line ("✓ PASSED (correctly detected)");
      else
         Put_Line ("FAILED: Expected File_Not_Found, got " & Status_Message (IO_Err));
      end if;
   end Test_Parse_Nonexistent_File;

   procedure Test_Write_File is
      Test_Content : constant String := "<test><data>Sample</data></test>";
      Write_Res    : constant Write_Result := Write_File (Output_Path, Test_Content);
      Read_Res     : constant Read_Result := Read_File (Output_Path);
   begin
      Put ("Test: Write File... ");
      if Write_Res.Status = Success
        and then Write_Res.Bytes_Written = Test_Content'Length
        and then Read_Res.Status = Success
        and then Read_Res.Content (1 .. Read_Res.Content_Length) = Test_Content
      then
         Put_Line ("✓ PASSED (write and verify)");
      else
         Put_Line ("FAILED: Write/read mismatch");
      end if;
   end Test_Write_File;

   procedure Test_Write_Document is
      Parse_Res : constant SML.DOM.Parser.Parse_Result := Parse_File (Valid_Small_Path);
   begin
      Put ("Test: Write Document... ");
      if not Parse_Res.Success then
         Put_Line ("FAILED: Could not load source document");
         return;
      end if;
      declare
         Write_Res : constant Write_Result := Write_Document (Output_Path, Parse_Res.Doc, True);
      begin
         if Write_Res.Status = Success and then Write_Res.Bytes_Written > 0 then
            Put_Line ("✓ PASSED");
         else
            Put_Line ("FAILED: Write error");
         end if;
      end;
   end Test_Write_Document;

   procedure Test_File_Exists is
   begin
      Put ("Test: File Exists Check... ");
      if File_Exists (Valid_Small_Path) then
         Put_Line ("✓ PASSED");
      else
         Put_Line ("FAILED: Existing file not detected");
      end if;
   end Test_File_Exists;

   procedure Test_File_Size is
      Size : constant Natural := File_Size (Valid_Small_Path);
   begin
      Put ("Test: File Size... ");
      if Size > 0 then
         Put_Line ("✓ PASSED (" & Size'Image & " bytes)");
      else
         Put_Line ("FAILED: Size should be > 0");
      end if;
   end Test_File_Size;

   procedure Test_Round_Trip is
      R : constant SML.DOM.Parser.Parse_Result := Parse_File (Valid_Medium_Path);
   begin
      Put ("Test: Round Trip... ");
      if R.Success and then Write_Document (Output_Path, R.Doc, True).Status = Success then
         Put_Line ("✓ PASSED");
      else
         Put_Line ("FAILED: Round trip failed");
      end if;
   end Test_Round_Trip;

begin
   Put_Line ("SML.IO Test Suite (staged crate)");
   Test_Read_Small_File;
   Test_Read_Medium_File;
   Test_Read_Nonexistent_File;
   Test_Parse_Valid_File;
   Test_Parse_Invalid_File;
   Test_Parse_Nonexistent_File;
   Test_Write_File;
   Test_Write_Document;
   Test_File_Exists;
   Test_File_Size;
   Test_Round_Trip;
   Put_Line ("Done.");
end Test_IO;

