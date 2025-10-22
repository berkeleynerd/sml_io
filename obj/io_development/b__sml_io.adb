pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (SML_IOmain, Spec_File_Name => "b__sml_io.ads");
pragma Source_File_Name (SML_IOmain, Body_File_Name => "b__sml_io.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body SML_IOmain is

   E011 : Short_Integer; pragma Import (Ada, E011, "ada__exceptions_E");
   E016 : Short_Integer; pragma Import (Ada, E016, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "ada__numerics_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__containers_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__io_exceptions_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "ada__strings_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__strings__utf_encoding_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "interfaces__c_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "system__os_lib_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__tags_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__strings__text_buffers_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__streams_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__file_control_block_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__finalization_root_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__finalization_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__file_io_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__storage_pools_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "ada__calendar_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "ada__calendar__time_zones_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "ada__strings__maps_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__strings__maps__constants_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ada__strings__unbounded_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__regexp_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__directories_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__sequential_io_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E169 := E169 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__sequential_io__finalize_spec");
      begin
         if E169 = 0 then
            F1;
         end if;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__directories__finalize_body");
      begin
         E007 := E007 - 1;
         if E007 = 0 then
            F2;
         end if;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__directories__finalize_spec");
      begin
         if E007 = 0 then
            F3;
         end if;
      end;
      E159 := E159 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__regexp__finalize_spec");
      begin
         if E159 = 0 then
            F4;
         end if;
      end;
      E139 := E139 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__strings__unbounded__finalize_spec");
      begin
         if E139 = 0 then
            F5;
         end if;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__file_io__finalize_body");
      begin
         E154 := E154 - 1;
         if E154 = 0 then
            F6;
         end if;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure SML_IOfinal is

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      finalize_library;
   end SML_IOfinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure SML_IOinit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Exception_Tracebacks_Symbolic : Integer;
      pragma Import (C, Exception_Tracebacks_Symbolic, "__gl_exception_tracebacks_symbolic");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");
      Interrupts_Default_To_System : Integer;
      pragma Import (C, Interrupts_Default_To_System, "__gl_interrupts_default_to_system");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Exception_Tracebacks_Symbolic := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      SML_IOmain'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      if E011 = 0 then
         Ada.Exceptions'Elab_Spec;
      end if;
      if E016 = 0 then
         System.Soft_Links'Elab_Spec;
      end if;
      if E027 = 0 then
         System.Exception_Table'Elab_Body;
      end if;
      E027 := E027 + 1;
      if E034 = 0 then
         Ada.Numerics'Elab_Spec;
      end if;
      E034 := E034 + 1;
      if E028 = 0 then
         System.Exceptions'Elab_Spec;
      end if;
      E028 := E028 + 1;
      if E023 = 0 then
         System.Soft_Links.Initialize'Elab_Body;
      end if;
      E023 := E023 + 1;
      E016 := E016 + 1;
      E011 := E011 + 1;
      if E098 = 0 then
         Ada.Containers'Elab_Spec;
      end if;
      E098 := E098 + 1;
      if E104 = 0 then
         Ada.Io_Exceptions'Elab_Spec;
      end if;
      E104 := E104 + 1;
      if E092 = 0 then
         Ada.Strings'Elab_Spec;
      end if;
      E092 := E092 + 1;
      if E108 = 0 then
         Ada.Strings.Utf_Encoding'Elab_Spec;
      end if;
      E108 := E108 + 1;
      if E059 = 0 then
         Interfaces.C'Elab_Spec;
      end if;
      E059 := E059 + 1;
      if E061 = 0 then
         System.Os_Lib'Elab_Body;
      end if;
      E061 := E061 + 1;
      if E116 = 0 then
         Ada.Tags'Elab_Spec;
      end if;
      if E116 = 0 then
         Ada.Tags'Elab_Body;
      end if;
      E116 := E116 + 1;
      if E106 = 0 then
         Ada.Strings.Text_Buffers'Elab_Spec;
      end if;
      E106 := E106 + 1;
      if E103 = 0 then
         Ada.Streams'Elab_Spec;
      end if;
      E103 := E103 + 1;
      if E157 = 0 then
         System.File_Control_Block'Elab_Spec;
      end if;
      E157 := E157 + 1;
      if E127 = 0 then
         System.Finalization_Root'Elab_Spec;
      end if;
      E127 := E127 + 1;
      if E101 = 0 then
         Ada.Finalization'Elab_Spec;
      end if;
      E101 := E101 + 1;
      if E154 = 0 then
         System.File_Io'Elab_Body;
      end if;
      E154 := E154 + 1;
      if E161 = 0 then
         System.Storage_Pools'Elab_Spec;
      end if;
      E161 := E161 + 1;
      if E009 = 0 then
         Ada.Calendar'Elab_Spec;
      end if;
      if E009 = 0 then
         Ada.Calendar'Elab_Body;
      end if;
      E009 := E009 + 1;
      if E077 = 0 then
         Ada.Calendar.Time_Zones'Elab_Spec;
      end if;
      E077 := E077 + 1;
      if E094 = 0 then
         Ada.Strings.Maps'Elab_Spec;
      end if;
      E094 := E094 + 1;
      if E097 = 0 then
         Ada.Strings.Maps.Constants'Elab_Spec;
      end if;
      E097 := E097 + 1;
      if E139 = 0 then
         Ada.Strings.Unbounded'Elab_Spec;
      end if;
      E139 := E139 + 1;
      if E159 = 0 then
         System.Regexp'Elab_Spec;
      end if;
      E159 := E159 + 1;
      if E007 = 0 then
         Ada.Directories'Elab_Spec;
      end if;
      if E007 = 0 then
         Ada.Directories'Elab_Body;
      end if;
      E007 := E007 + 1;
      if E169 = 0 then
         System.Sequential_Io'Elab_Spec;
      end if;
      E169 := E169 + 1;
   end SML_IOinit;

--  BEGIN Object file/option list
   --   /Users/rebecca/src/github.com/berkeleynerd/sml/crates/sml-io/obj/io_development/sml-io.o
   --   -L/Users/rebecca/src/github.com/berkeleynerd/sml/crates/sml-io/obj/io_development/
   --   -L/Users/rebecca/src/github.com/berkeleynerd/sml/lib/
   --   -L/private/tmp/.local/share/alire/toolchains/gnat_native_15.1.2_60748c54/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end SML_IOmain;
