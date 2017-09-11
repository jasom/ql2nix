
{ buildLispPackage, stdenv, fetchurl, lisp-project_lass-flexbox, 
   lisp_fiveam, lisp_lass-flexbox,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_lass-flexbox  ];
      inherit stdenv;
      systemName = "lass-flexbox-test";
      
      sourceProject = "${lisp-project_lass-flexbox}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_lass-flexbox}";
      name = "lisp_lass-flexbox-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
