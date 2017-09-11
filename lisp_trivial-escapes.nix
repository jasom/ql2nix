
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-escapes, 
   lisp_named-readtables,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "trivial-escapes";
      
      sourceProject = "${lisp-project_trivial-escapes}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_trivial-escapes-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
