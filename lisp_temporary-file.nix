
{ buildLispPackage, stdenv, fetchurl, lisp-project_temporary-file, 
   lisp_unit-test, lisp_cl-ppcre, lisp_cl-fad, lisp_bordeaux-threads, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_unit-test lisp_cl-ppcre lisp_cl-fad lisp_bordeaux-threads lisp_alexandria  ];
      inherit stdenv;
      systemName = "temporary-file";
      
      sourceProject = "${lisp-project_temporary-file}";
      patches = [];
      lisp_dependencies = "${lisp_unit-test} ${lisp_cl-ppcre} ${lisp_cl-fad} ${lisp_bordeaux-threads} ${lisp_alexandria}";
      name = "lisp_temporary-file-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
