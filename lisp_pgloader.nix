
{ buildLispPackage, stdenv, fetchurl, lisp-project_pgloader, 
   lisp_quri, lisp_uuid, lisp_mssql, lisp_cl-markdown, lisp_trivial-backtrace, lisp_sqlite, lisp_py-configparser, lisp_ixf, lisp_db3, lisp_abnf, lisp_command-line-arguments, lisp_local-time, lisp_drakma, lisp_esrap, lisp_lparallel, lisp_cl-fad, lisp_cl-csv, lisp_qmynd, lisp_postmodern, lisp_cl-log,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_quri lisp_uuid lisp_mssql lisp_cl-markdown lisp_trivial-backtrace lisp_sqlite lisp_py-configparser lisp_ixf lisp_db3 lisp_abnf lisp_command-line-arguments lisp_local-time lisp_drakma lisp_esrap lisp_lparallel lisp_cl-fad lisp_cl-csv lisp_qmynd lisp_postmodern lisp_cl-log  ];
      inherit stdenv;
      systemName = "pgloader";
      
      sourceProject = "${lisp-project_pgloader}";
      patches = [];
      lisp_dependencies = "${lisp_quri} ${lisp_uuid} ${lisp_mssql} ${lisp_cl-markdown} ${lisp_trivial-backtrace} ${lisp_sqlite} ${lisp_py-configparser} ${lisp_ixf} ${lisp_db3} ${lisp_abnf} ${lisp_command-line-arguments} ${lisp_local-time} ${lisp_drakma} ${lisp_esrap} ${lisp_lparallel} ${lisp_cl-fad} ${lisp_cl-csv} ${lisp_qmynd} ${lisp_postmodern} ${lisp_cl-log}";
      name = "lisp_pgloader-v3.4.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
