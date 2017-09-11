
{ buildLispPackage, stdenv, fetchurl, lisp-project_rfc2109, 
   lisp_fiveam, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_split-sequence  ];
      inherit stdenv;
      systemName = "rfc2109/test";
      
      sourceProject = "${lisp-project_rfc2109}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_split-sequence}";
      name = "lisp_rfc2109-test-20151218-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
