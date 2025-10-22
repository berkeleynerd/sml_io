------------------------------------------------------------------------------
--  SML.IO Package Specification (staged crate)
--  File I/O Utilities for SML Documents
--  SPARK Ada Specification with Contracts (Body uses I/O, SPARK_Mode Off)
------------------------------------------------------------------------------

with SML.DOM;
with SML.DOM.Parser;

package SML.IO
  with SPARK_Mode => On,
       Abstract_State => File_System,
       Initializes => File_System
is

   pragma Elaborate_Body;

   Max_File_Size   : constant := 1_000_000;  -- 1 MB
   Max_Path_Length : constant := 4096;

   type IO_Status is
     (Success,
      File_Not_Found,
      File_Too_Large,
      Read_Error,
      Write_Error,
      Parse_Error);

   type Read_Result (Status : IO_Status := File_Not_Found) is record
      case Status is
         when Success =>
            Content_Length : Natural range 0 .. Max_File_Size;
            Content        : String (1 .. Max_File_Size);
         when others =>
            null;
      end case;
   end record;

   function Read_File (Path : String) return Read_Result
   with
     Pre => Path'Length > 0 and then Path'Length <= Max_Path_Length,
     Post =>
       (if Read_File'Result.Status = Success
        then Read_File'Result.Content_Length > 0
             and then Read_File'Result.Content_Length <= Max_File_Size),
     Global => (Input => File_System);

   function Parse_File (Path : String) return SML.DOM.Parser.Parse_Result
   with
     Pre => Path'Length > 0 and then Path'Length <= Max_Path_Length,
     Global => (Input => File_System);

   function Parse_File_IO_Error (Path : String) return IO_Status
   with
     Pre => Path'Length > 0 and then Path'Length <= Max_Path_Length,
     Global => (Input => File_System);

   type Write_Result is record
      Status        : IO_Status;
      Bytes_Written : Natural := 0;
   end record;

   function Write_File (Path : String; Content : String) return Write_Result
   with
     Pre => Path'Length > 0
            and then Path'Length <= Max_Path_Length
            and then Content'Length <= Max_File_Size,
     Post =>
       (if Write_File'Result.Status = Success
        then Write_File'Result.Bytes_Written = Content'Length);

   function Write_Document
     (Path      : String;
      Doc       : SML.DOM.Document;
      Formatted : Boolean := True) return Write_Result
   with
     Pre => Path'Length > 0
            and then Path'Length <= Max_Path_Length
            and then SML.DOM.Is_Well_Formed (Doc),
     Post =>
       (if Write_Document'Result.Status = Success
        then Write_Document'Result.Bytes_Written > 0);

   function File_Exists (Path : String) return Boolean
   with
     Pre => Path'Length > 0 and then Path'Length <= Max_Path_Length,
     Global => (Input => File_System);

   function File_Size (Path : String) return Natural
   with
     Pre => Path'Length > 0 and then Path'Length <= Max_Path_Length,
     Post => File_Size'Result <= Max_File_Size,
     Global => (Input => File_System);

   function Status_Message (Status : IO_Status) return String
   with
     Global => null,
     Post => Status_Message'Result'Length > 0
             and then Status_Message'Result'Length <= 100;

end SML.IO;

