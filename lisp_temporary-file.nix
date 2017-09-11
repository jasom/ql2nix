
{ buildLispPackage, stdenv, fetchurl, lisp-project_temporary-file, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-fad, lisp_cl-ppcre, lisp_unit-test,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-fad lisp_cl-ppcre lisp_unit-test  ];
      inherit stdenv;
      systemName = "temporary-file";
      
      sourceProject = "${lisp-project_temporary-file}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_unit-test}";
      name = "lisp_temporary-file-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
