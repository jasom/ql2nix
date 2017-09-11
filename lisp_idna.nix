
{ buildLispPackage, stdenv, fetchurl, lisp-project_idna, 
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
      systemName = "idna";
      
      sourceProject = "${lisp-project_idna}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence}";
      name = "lisp_idna-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
