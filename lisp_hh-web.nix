
{ buildLispPackage, stdenv, fetchurl, lisp-project_hh-web, 
   lisp_bordeaux-threads, lisp_cl-base64, lisp_cl-fad, lisp_cl-ppcre, lisp_drakma, lisp_hunchentoot, lisp_ironclad, lisp_local-time, lisp_log5, lisp_parenscript, lisp_trivial-backtrace, lisp_uuid, lisp_vecto,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-base64 lisp_cl-fad lisp_cl-ppcre lisp_drakma lisp_hunchentoot lisp_ironclad lisp_local-time lisp_log5 lisp_parenscript lisp_trivial-backtrace lisp_uuid lisp_vecto  ];
      inherit stdenv;
      systemName = "hh-web";
      
      sourceProject = "${lisp-project_hh-web}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-base64} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_hunchentoot} ${lisp_ironclad} ${lisp_local-time} ${lisp_log5} ${lisp_parenscript} ${lisp_trivial-backtrace} ${lisp_uuid} ${lisp_vecto}";
      name = "lisp_hh-web-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
