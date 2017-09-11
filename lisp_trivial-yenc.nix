
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-yenc, 
   lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence  ];
      inherit stdenv;
      systemName = "trivial-yenc";
      
      sourceProject = "${lisp-project_trivial-yenc}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence}";
      name = "lisp_trivial-yenc-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
