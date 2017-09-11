
{ buildLispPackage, stdenv, fetchurl, lisp-project_proc-parse, 
   lisp_alexandria, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel  ];
      inherit stdenv;
      systemName = "proc-parse";
      
      sourceProject = "${lisp-project_proc-parse}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel}";
      name = "lisp_proc-parse-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
