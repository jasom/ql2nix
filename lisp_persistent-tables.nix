
{ buildLispPackage, stdenv, fetchurl, lisp-project_persistent-tables, 
   lisp_random-access-lists,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_random-access-lists  ];
      inherit stdenv;
      systemName = "persistent-tables";
      
      sourceProject = "${lisp-project_persistent-tables}";
      patches = [];
      lisp_dependencies = "${lisp_random-access-lists}";
      name = "lisp_persistent-tables-20120208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
