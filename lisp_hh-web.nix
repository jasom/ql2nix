
{ buildLispPackage, stdenv, fetchurl, lisp-project_hh-web, 
   lisp_uuid, lisp_ironclad, lisp_vecto, lisp_local-time, lisp_parenscript, lisp_drakma, lisp_hunchentoot, lisp_bordeaux-threads, lisp_log5, lisp_trivial-backtrace,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uuid lisp_ironclad lisp_vecto lisp_local-time lisp_parenscript lisp_drakma lisp_hunchentoot lisp_bordeaux-threads lisp_log5 lisp_trivial-backtrace  ];
      inherit stdenv;
      systemName = "hh-web";
      
      sourceProject = "${lisp-project_hh-web}";
      patches = [];
      lisp_dependencies = "${lisp_uuid} ${lisp_ironclad} ${lisp_vecto} ${lisp_local-time} ${lisp_parenscript} ${lisp_drakma} ${lisp_hunchentoot} ${lisp_bordeaux-threads} ${lisp_log5} ${lisp_trivial-backtrace}";
      name = "lisp_hh-web-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
